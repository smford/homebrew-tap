#!/usr/bin/env python3
"""
generate_docs.py

Production-grade metadata extractor and documentation generator for Homebrew taps.
Extracts formula definitions from `Formula/*.rb` to produce:
1. An informative, well-structured README.md
2. A modern, responsive, accessible GitHub Pages site in `_site/index.html`
"""

import os
import re
import sys
import html
import subprocess
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Dict, Optional
from datetime import datetime, timezone


@dataclass
class Artifact:
    os_name: str
    arch: str
    url: str
    sha256: str


@dataclass
class Formula:
    name: str
    class_name: str
    desc: str
    homepage: str
    version: str
    license: str
    platforms: List[str] = field(default_factory=list)
    artifacts: List[Artifact] = field(default_factory=list)
    binaries: List[str] = field(default_factory=list)
    dependencies: List[str] = field(default_factory=list)
    caveats: Optional[str] = None
    file_path: str = ""

    @property
    def install_command_tap(self) -> str:
        return f"brew install {self.name}"

    def install_command_full(self, tap: str) -> str:
        return f"brew install {tap}/{self.name}"


class FormulaParser:
    """Parses Ruby-based Homebrew formula files."""

    @staticmethod
    def _extract_url_and_sha(block_text: str, version: str) -> tuple[str, str]:
        url_match = re.search(r'url\s+["\']([^"\']+)["\']', block_text)
        sha_match = re.search(r'sha256\s+["\']([0-9a-fA-F]{64})["\']', block_text)

        raw_url = url_match.group(1) if url_match else ""
        resolved_url = raw_url.replace("#{version}", version)
        sha = sha_match.group(1) if sha_match else ""
        return resolved_url, sha

    @classmethod
    def parse_file(cls, path: Path) -> Optional[Formula]:
        try:
            content = path.read_text(encoding="utf-8")
        except Exception as e:
            print(f"Error reading {path}: {e}", file=sys.stderr)
            return None

        name = path.stem

        # Extract Class Name
        class_match = re.search(r'class\s+([A-Za-z0-9_]+)\s*<\s*Formula', content)
        class_name = class_match.group(1) if class_match else name.capitalize()

        # Extract description
        desc_match = re.search(r'^\s*desc\s+["\'](.*?)["\']\s*$', content, re.MULTILINE)
        desc = desc_match.group(1).strip() if desc_match else ""

        # Extract homepage
        hp_match = re.search(r'^\s*homepage\s+["\'](.*?)["\']\s*$', content, re.MULTILINE)
        homepage = hp_match.group(1).strip() if hp_match else ""

        # Extract version
        ver_match = re.search(r'^\s*version\s+["\'](.*?)["\']\s*$', content, re.MULTILINE)
        if ver_match:
            version = ver_match.group(1).strip()
        else:
            # Fallback: extract version from download URL
            url_match = re.search(r'url\s+["\'](.*?)["\']', content)
            if url_match:
                v_match = re.search(r'v?(\d+\.\d+(?:\.\d+)?(?:-[a-zA-Z0-9.]+)?)\.(?:tar\.gz|zip|tgz)', url_match.group(1))
                version = v_match.group(1) if v_match else "latest"
            else:
                version = "latest"

        # Extract license
        lic_match = re.search(r'^\s*license\s+["\'](.*?)["\']\s*$', content, re.MULTILINE)
        license_str = lic_match.group(1).strip() if lic_match else "Unspecified"

        # Extract binaries
        binaries = re.findall(r'bin\.install\s+["\']([^"\']+)["\']', content)
        if not binaries:
            binaries = [name]

        # Extract dependencies
        dependencies = re.findall(r'depends_on\s+["\':]([a-zA-Z0-9_\-]+)', content)

        # Extract caveats
        caveats = None
        caveats_match = re.search(r'(?:def\s+caveats|caveats\s+do)\s*\n(.*?)\n\s*end', content, re.DOTALL)
        if caveats_match:
            caveats_lines = [line.strip().strip('"').strip("'") for line in caveats_match.group(1).splitlines() if line.strip()]
            caveats = "\n".join(caveats_lines)

        # Parse platform artifacts & platform list
        platforms: List[str] = []
        artifacts: List[Artifact] = []

        # macOS block
        macos_match = re.search(r'on_macos\s+do(.*?)end\s*(?=\n\s*(?:on_linux|def|test|\Z))', content, re.DOTALL)
        if macos_match:
            macos_text = macos_match.group(1)
            arm_match = re.search(r'on_arm\s+do(.*?)end', macos_text, re.DOTALL)
            intel_match = re.search(r'on_intel\s+do(.*?)end', macos_text, re.DOTALL)

            if arm_match:
                u, s = cls._extract_url_and_sha(arm_match.group(1), version)
                if u:
                    artifacts.append(Artifact(os_name="macOS", arch="Apple Silicon (ARM64)", url=u, sha256=s))
            if intel_match:
                u, s = cls._extract_url_and_sha(intel_match.group(1), version)
                if u:
                    artifacts.append(Artifact(os_name="macOS", arch="Intel (x86_64)", url=u, sha256=s))

            if arm_match and intel_match:
                platforms.append("macOS (Apple Silicon & Intel)")
            elif arm_match:
                platforms.append("macOS (Apple Silicon)")
            elif intel_match:
                platforms.append("macOS (Intel)")
            else:
                platforms.append("macOS")

        # Linux block
        linux_match = re.search(r'on_linux\s+do(.*?)end\s*(?=\n\s*(?:on_macos|def|test|\Z))', content, re.DOTALL)
        if linux_match:
            linux_text = linux_match.group(1)
            arm_match = re.search(r'on_arm\s+do(.*?)end', linux_text, re.DOTALL)
            intel_match = re.search(r'on_intel\s+do(.*?)end', linux_text, re.DOTALL)

            if arm_match:
                u, s = cls._extract_url_and_sha(arm_match.group(1), version)
                if u:
                    artifacts.append(Artifact(os_name="Linux", arch="ARM64", url=u, sha256=s))
            if intel_match:
                u, s = cls._extract_url_and_sha(intel_match.group(1), version)
                if u:
                    artifacts.append(Artifact(os_name="Linux", arch="x86_64", url=u, sha256=s))

            if arm_match and intel_match:
                platforms.append("Linux (ARM64 & x86_64)")
            elif arm_match:
                platforms.append("Linux (ARM64)")
            elif intel_match:
                platforms.append("Linux (x86_64)")
            else:
                platforms.append("Linux")

        # Fallback if no specific OS block
        if not artifacts:
            top_url, top_sha = cls._extract_url_and_sha(content, version)
            if top_url:
                artifacts.append(Artifact(os_name="Universal", arch="All", url=top_url, sha256=top_sha))
        if not platforms:
            platforms.append("macOS & Linux")

        return Formula(
            name=name,
            class_name=class_name,
            desc=desc,
            homepage=homepage,
            version=version,
            license=license_str,
            platforms=platforms,
            artifacts=artifacts,
            binaries=binaries,
            dependencies=dependencies,
            caveats=caveats,
            file_path=str(path.as_posix()),
        )


def get_repo_info() -> tuple[str, str, str]:
    """Returns (owner, repo_name, tap_name)."""
    env_repo = os.environ.get("GITHUB_REPOSITORY")
    owner, repo = "smford", "homebrew-tap"
    if env_repo and "/" in env_repo:
        owner, repo = env_repo.split("/", 1)
    else:
        try:
            remote_url = subprocess.check_output(
                ["git", "config", "--get", "remote.origin.url"],
                text=True, stderr=subprocess.DEVNULL
            ).strip()
            m = re.search(r'github\.com[:/]([^/]+)/([^/.]+)(?:\.git)?$', remote_url)
            if m:
                owner, repo = m.group(1), m.group(2)
        except Exception:
            pass

    if repo.startswith("homebrew-"):
        short_name = repo[len("homebrew-"):]
        tap_name = f"{owner}/{short_name}"
    else:
        tap_name = f"{owner}/{repo}"

    return owner, repo, tap_name


class ReadmeGenerator:
    """Generates the README.md content."""

    @staticmethod
    def generate(owner: str, repo: str, tap_name: str, formulas: List[Formula]) -> str:
        repo_url = f"https://github.com/{owner}/{repo}"
        pages_url = f"https://{owner}.github.io/{repo}/"
        badge_workflow = f"{repo_url}/actions/workflows/docs-and-pages.yml/badge.svg"
        workflow_url = f"{repo_url}/actions/workflows/docs-and-pages.yml"

        lines = [
            f"# {tap_name}",
            "",
            f"[![Documentation & Pages]({badge_workflow})]({workflow_url})",
            f"[![GitHub Pages](https://img.shields.io/badge/docs-GitHub%20Pages-2563eb.svg)]({pages_url})",
            f"![Formulas Count](https://img.shields.io/badge/formulas-{len(formulas)}-10b981.svg)",
            "",
            f"Official [Homebrew](https://brew.sh/) tap for [{owner}]({repo_url}).",
            f"Browse the interactive documentation and web catalog at **[{pages_url}]({pages_url})**.",
            "",
            "## 📦 Installation & Usage",
            "",
            "### Method 1: Tap repository (Recommended)",
            "",
            "Add this tap once to Homebrew, then install any package directly by its formula name:",
            "",
            "```bash",
            f"# Add this tap to your Homebrew installation",
            f"brew tap {tap_name}",
            "",
            f"# Install a formula (e.g. {formulas[0].name if formulas else 'formula_name'})",
            f"brew install {formulas[0].name if formulas else 'formula_name'}",
            "```",
            "",
            "### Method 2: Single command install",
            "",
            "Install a formula without explicitly tapping the repository:",
            "",
            "```bash",
            f"brew install {tap_name}/<formula>",
            "```",
            "",
            "---",
            "",
            "## 📋 Available Formulas",
            "",
            "| Formula | Description | Version | License | Platforms | Quick Install |",
            "| :--- | :--- | :--- | :--- | :--- | :--- |",
        ]

        for f in formulas:
            platforms_str = ", ".join(f.platforms)
            lines.append(
                f"| [`{f.name}`](#{f.name}) | {f.desc} | `{f.version}` | `{f.license}` | {platforms_str} | `brew install {tap_name}/{f.name}` |"
            )

        lines.extend([
            "",
            "---",
            "",
            "## 🔍 Formula Details",
            "",
        ])

        for f in formulas:
            lines.extend([
                f"### `{f.name}`",
                "",
                f"**Description:** {f.desc}  ",
                f"**Homepage:** [{f.homepage}]({f.homepage})  ",
                f"**Version:** `{f.version}`  ",
                f"**License:** `{f.license}`  ",
                f"**Source:** [`Formula/{f.name}.rb`](Formula/{f.name}.rb)  ",
                "",
                "**Install:**",
                "```bash",
                f"brew install {tap_name}/{f.name}",
                "```",
                "",
                "**Supported Platforms & Packages:**",
                "",
            ])

            if f.artifacts:
                lines.extend([
                    "| OS / Architecture | Binary Package | SHA-256 Checksum |",
                    "| :--- | :--- | :--- |",
                ])
                for a in f.artifacts:
                    filename = a.url.split("/")[-1]
                    lines.append(f"| {a.os_name} ({a.arch}) | [`{filename}`]({a.url}) | `{a.sha256[:16]}...` |")
                lines.append("")
            else:
                for p in f.platforms:
                    lines.append(f"- {p}")
                lines.append("")

            if f.binaries:
                bin_str = ", ".join(f"`{b}`" for b in f.binaries)
                lines.append(f"**Installed Binaries:** {bin_str}  ")
                lines.append("")

            if f.dependencies:
                dep_str = ", ".join(f"`{d}`" for d in f.dependencies)
                lines.append(f"**Dependencies:** {dep_str}  ")
                lines.append("")

            if f.caveats:
                lines.extend([
                    "**Caveats:**",
                    "```text",
                    f.caveats,
                    "```",
                    "",
                ])

            lines.extend([
                "**Verification & Update:**",
                "```bash",
                f"brew test {f.name}       # Run formula self-tests",
                f"brew upgrade {f.name}    # Upgrade to the latest version",
                "```",
                "",
                "---",
                "",
            ])

        lines.extend([
            "## 🛠 Maintenance & Tap Commands",
            "",
            "```bash",
            "# Update Homebrew formula definitions and check for upgrades",
            "brew update",
            "",
            "# Upgrade all installed packages from this tap",
            "brew upgrade",
            "",
            f"# Remove a package",
            f"brew uninstall <formula>",
            "",
            f"# Untap this repository",
            f"brew untap {tap_name}",
            "```",
            "",
            "## 🤖 Automated CI/CD",
            "",
            f"This repository uses **GitHub Actions** to automatically update documentation whenever a formula in `Formula/*.rb` is modified:",
            "- Updates and formats `README.md`",
            f"- Builds and deploys the static GitHub Page to [{pages_url}]({pages_url})",
            "",
            "---",
            f"<sub>Documentation automatically generated on `{datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S UTC')}`.</sub>",
            ""
        ])

        return "\n".join(lines)


class HtmlGenerator:
    """Generates a modern, accessible, zero-dependency GitHub Pages site."""

    @staticmethod
    def generate(owner: str, repo: str, tap_name: str, formulas: List[Formula]) -> str:
        repo_url = f"https://github.com/{owner}/{repo}"
        now_str = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")

        cards_html = []
        for f in formulas:
            platforms_pills = "".join(
                f'<span class="pill pill-platform">{html.escape(p)}</span>' for p in f.platforms
            )

            artifacts_rows = ""
            for a in f.artifacts:
                filename = a.url.split("/")[-1]
                artifacts_rows += f"""
                <tr>
                  <td><strong>{html.escape(a.os_name)}</strong> <span class="text-muted">({html.escape(a.arch)})</span></td>
                  <td><a href="{html.escape(a.url)}" class="link" target="_blank" rel="noopener">{html.escape(filename)}</a></td>
                  <td>
                    <div class="hash-row">
                      <code class="hash-code" title="{html.escape(a.sha256)}">{html.escape(a.sha256[:14])}...</code>
                      <button class="btn-copy-hash" data-copy="{html.escape(a.sha256)}" title="Copy full SHA-256 hash" aria-label="Copy full SHA-256 hash">
                        <svg class="icon" viewBox="0 0 16 16" width="14" height="14" fill="currentColor"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"></path><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"></path></svg>
                      </button>
                    </div>
                  </td>
                </tr>
                """

            caveats_html = ""
            if f.caveats:
                caveats_html = f"""
                <div class="card-section caveats-box">
                  <div class="section-title">⚠️ Caveats</div>
                  <pre class="code-block"><code>{html.escape(f.caveats)}</code></pre>
                </div>
                """

            deps_html = ""
            if f.dependencies:
                dep_pills = "".join(f'<span class="pill pill-dep">{html.escape(d)}</span>' for d in f.dependencies)
                deps_html = f"""
                <div class="card-meta-item">
                  <span class="meta-label">Dependencies:</span>
                  <div class="pills-container">{dep_pills}</div>
                </div>
                """

            bin_html = ""
            if f.binaries:
                bin_pills = "".join(f'<code class="inline-code">{html.escape(b)}</code>' for b in f.binaries)
                bin_html = f"""
                <div class="card-meta-item">
                  <span class="meta-label">Binaries:</span>
                  <div class="pills-container">{bin_pills}</div>
                </div>
                """

            artifacts_table_html = ""
            if artifacts_rows:
                artifacts_table_html = f"""
                <div class="card-section">
                  <details class="accordion">
                    <summary class="accordion-summary">
                      <span>Download Artifacts & Checksums ({len(f.artifacts)})</span>
                      <svg class="accordion-chevron" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><path d="M12.78 6.22a.75.75 0 0 1 0 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L3.22 7.28a.75.75 0 0 1 1.06-1.06L8 9.94l3.72-3.72a.75.75 0 0 1 1.06 0Z"></path></svg>
                    </summary>
                    <div class="accordion-content">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>Platform</th>
                              <th>Archive</th>
                              <th>SHA-256</th>
                            </tr>
                          </thead>
                          <tbody>
                            {artifacts_rows}
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </details>
                </div>
                """

            formula_source_url = f"{repo_url}/blob/main/Formula/{f.name}.rb"
            full_install = f"brew install {tap_name}/{f.name}"
            short_install = f"brew install {f.name}"

            search_keywords = f"{f.name} {f.desc} {f.version} {f.license} {' '.join(f.platforms)} {' '.join(f.binaries)}".lower()

            card = f"""
            <article class="formula-card" data-keywords="{html.escape(search_keywords)}">
              <header class="card-header">
                <div class="card-title-group">
                  <h3 class="formula-name">
                    <a href="{html.escape(f.homepage)}" target="_blank" rel="noopener" class="formula-title-link">
                      {html.escape(f.name)}
                    </a>
                  </h3>
                  <span class="pill pill-version">v{html.escape(f.version)}</span>
                  <span class="pill pill-license">{html.escape(f.license)}</span>
                </div>
                <div class="card-links">
                  <a href="{html.escape(formula_source_url)}" class="card-action-link" target="_blank" rel="noopener" title="View Formula Source on GitHub">
                    <svg class="icon" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><path d="M8 0c4.42 0 8 3.58 8 8a8.013 8.013 0 0 1-5.45 7.59c-.4.08-.55-.17-.55-.38 0-.27.01-1.13.01-2.2 0-.75-.25-1.23-.54-1.48 1.78-.2 3.65-.88 3.65-3.95 0-.88-.31-1.59-.82-2.15.08-.2.36-1.02-.08-2.12 0 0-.67-.22-2.2.82-.64-.18-1.32-.27-2-.27-.68 0-1.36.09-2 .27-1.53-1.03-2.2-.82-2.2-.82-.44 1.1-.16 1.92-.08 2.12-.51.56-.82 1.28-.82 2.15 0 3.06 1.86 3.75 3.64 3.95-.23.2-.44.55-.51 1.07-.46.21-1.61.55-2.33-.66-.15-.24-.6-.83-1.23-.82-.67.01-.27.38.01.53.34.19.73.9.82 1.13.16.45.68 1.31 2.69.94 0 .67.01 1.3.01 1.49 0 .21-.15.45-.55.38A7.995 7.995 0 0 1 0 8c0-4.42 3.58-8 8-8Z"></path></svg>
                    <span>Formula</span>
                  </a>
                  <a href="{html.escape(f.homepage)}" class="card-action-link" target="_blank" rel="noopener" title="Visit Project Homepage">
                    <svg class="icon" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><path d="M3.75 2h3.5a.75.75 0 0 1 0 1.5h-3.5a.25.25 0 0 0-.25.25v8.5c0 .138.112.25.25.25h8.5a.25.25 0 0 0 .25-.25v-3.5a.75.75 0 0 1 1.5 0v3.5A1.75 1.75 0 0 1 12.25 14h-8.5A1.75 1.75 0 0 1 2 12.25v-8.5C2 2.784 2.784 2 3.75 2Zm6.854-1h4.146a.75.75 0 0 1 .75.75v4.146a.75.75 0 0 1-1.28.53l-1.077-1.077-3.546 3.546a.75.75 0 0 1-1.06-1.06l3.546-3.546-1.077-1.077a.75.75 0 0 1 .53-1.28l-.942.016Z"></path></svg>
                    <span>Homepage</span>
                  </a>
                </div>
              </header>

              <div class="card-body">
                <p class="formula-desc">{html.escape(f.desc)}</p>

                <div class="terminal-install">
                  <div class="terminal-cmd">
                    <span class="terminal-prompt">$</span>
                    <span class="cmd-text">{html.escape(full_install)}</span>
                  </div>
                  <button class="btn-copy-install" data-copy="{html.escape(full_install)}" aria-label="Copy install command">
                    <svg class="icon copy-icon" viewBox="0 0 16 16" width="14" height="14" fill="currentColor"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"></path><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"></path></svg>
                    <span class="copy-label">Copy</span>
                  </button>
                </div>

                <div class="card-meta">
                  <div class="card-meta-item">
                    <span class="meta-label">Platforms:</span>
                    <div class="pills-container">{platforms_pills}</div>
                  </div>
                  {bin_html}
                  {deps_html}
                </div>

                {caveats_html}
                {artifacts_table_html}
              </div>
            </article>
            """
            cards_html.append(card)

        all_cards_str = "\n".join(cards_html)

        html_template = f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="light dark">
  <meta name="description" content="Official Homebrew Tap for {html.escape(tap_name)} packages and developer utilities.">
  <title>{html.escape(tap_name)} | Homebrew Tap Catalog</title>

  <!-- Prevent theme flicker / FOUC -->
  <script>
    (function() {{
      const savedTheme = localStorage.getItem('theme');
      if (savedTheme === 'dark' || savedTheme === 'light') {{
        document.documentElement.setAttribute('data-theme', savedTheme);
      }}
    }})();
  </script>

  <style>
    /* Modern CSS Design Tokens conforming to modern-web-guidance */
    :root {{
      --bg-page: #f8fafc;
      --bg-surface: #ffffff;
      --bg-surface-alt: #f1f5f9;
      --border-color: #e2e8f0;
      --border-highlight: #cbd5e1;
      --text-main: #0f172a;
      --text-muted: #64748b;
      --brand: #2563eb;
      --brand-hover: #1d4ed8;
      --accent: #f59e0b;
      --code-bg: #1e293b;
      --code-text: #f8fafc;
      --pill-bg: #e2e8f0;
      --pill-text: #334155;
      --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
      --card-shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.08), 0 4px 6px -4px rgba(0, 0, 0, 0.04);
      --radius-sm: 6px;
      --radius-md: 10px;
      --radius-lg: 16px;
      --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    }}

    @media (prefers-color-scheme: dark) {{
      :root:not([data-theme="light"]) {{
        --bg-page: #090d16;
        --bg-surface: #131b2e;
        --bg-surface-alt: #1a243d;
        --border-color: #243152;
        --border-highlight: #3b4e7e;
        --text-main: #f8fafc;
        --text-muted: #94a3b8;
        --brand: #3b82f6;
        --brand-hover: #60a5fa;
        --accent: #fbbf24;
        --code-bg: #0b1120;
        --code-text: #f1f5f9;
        --pill-bg: #1e293b;
        --pill-text: #cbd5e1;
        --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.4);
        --card-shadow-hover: 0 10px 20px -3px rgba(0, 0, 0, 0.6);
      }}
    }}

    :root[data-theme="dark"] {{
      --bg-page: #090d16;
      --bg-surface: #131b2e;
      --bg-surface-alt: #1a243d;
      --border-color: #243152;
      --border-highlight: #3b4e7e;
      --text-main: #f8fafc;
      --text-muted: #94a3b8;
      --brand: #3b82f6;
      --brand-hover: #60a5fa;
      --accent: #fbbf24;
      --code-bg: #0b1120;
      --code-text: #f1f5f9;
      --pill-bg: #1e293b;
      --pill-text: #cbd5e1;
      --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.4);
      --card-shadow-hover: 0 10px 20px -3px rgba(0, 0, 0, 0.6);
    }}

    *, *::before, *::after {{
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }}

    body {{
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
      background-color: var(--bg-page);
      color: var(--text-main);
      line-height: 1.6;
      transition: background-color 0.25s ease, color 0.25s ease;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }}

    a {{
      color: var(--brand);
      text-decoration: none;
      transition: var(--transition);
    }}
    a:hover {{
      color: var(--brand-hover);
    }}

    .container {{
      max-width: 1080px;
      margin: 0 auto;
      padding: 0 1.5rem;
      width: 100%;
    }}

    /* Header & Navigation */
    .site-header {{
      background-color: var(--bg-surface);
      border-bottom: 1px solid var(--border-color);
      padding: 1.25rem 0;
      position: sticky;
      top: 0;
      z-index: 100;
      backdrop-filter: blur(12px);
    }}

    .nav-wrapper {{
      display: flex;
      justify-content: space-between;
      align-items: center;
    }}

    .site-logo {{
      display: flex;
      align-items: center;
      gap: 0.75rem;
      font-weight: 700;
      font-size: 1.25rem;
      color: var(--text-main);
    }}
    .site-logo .beer-icon {{
      font-size: 1.5rem;
    }}

    .nav-actions {{
      display: flex;
      align-items: center;
      gap: 1rem;
    }}

    .nav-btn {{
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem 0.85rem;
      background-color: var(--bg-surface-alt);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-sm);
      color: var(--text-main);
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: var(--transition);
    }}
    .nav-btn:hover {{
      border-color: var(--border-highlight);
      background-color: var(--border-color);
    }}

    /* Hero Section */
    .hero {{
      padding: 3.5rem 0 2rem 0;
      text-align: center;
    }}

    .hero-badge {{
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      background: rgba(37, 99, 235, 0.1);
      color: var(--brand);
      padding: 0.35rem 0.85rem;
      border-radius: 9999px;
      font-size: 0.825rem;
      font-weight: 600;
      margin-bottom: 1rem;
    }}

    .hero-title {{
      font-size: 2.75rem;
      font-weight: 800;
      letter-spacing: -0.03em;
      margin-bottom: 1rem;
      line-height: 1.2;
    }}

    .hero-subtitle {{
      font-size: 1.2rem;
      color: var(--text-muted);
      max-width: 650px;
      margin: 0 auto 2rem auto;
    }}

    /* Global Tap Instruction Box */
    .tap-install-banner {{
      max-width: 720px;
      margin: 0 auto 2.5rem auto;
      background: var(--code-bg);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-md);
      padding: 1rem 1.25rem;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 1rem;
      box-shadow: var(--card-shadow);
    }}

    .tap-command-group {{
      display: flex;
      align-items: center;
      gap: 0.75rem;
      overflow-x: auto;
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
      color: var(--code-text);
      font-size: 0.95rem;
    }}

    .prompt-sym {{
      color: var(--brand);
      user-select: none;
      font-weight: 700;
    }}

    .btn-copy-global {{
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      background: rgba(255, 255, 255, 0.12);
      border: 1px solid rgba(255, 255, 255, 0.2);
      color: #ffffff;
      padding: 0.4rem 0.75rem;
      border-radius: var(--radius-sm);
      font-size: 0.8rem;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      white-space: nowrap;
    }}
    .btn-copy-global:hover {{
      background: rgba(255, 255, 255, 0.22);
    }}

    /* Filter & Search Bar */
    .controls-bar {{
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 1rem;
      margin-bottom: 2rem;
      flex-wrap: wrap;
    }}

    .search-box {{
      position: relative;
      flex: 1;
      min-width: 260px;
    }}

    .search-input {{
      width: 100%;
      padding: 0.75rem 1rem 0.75rem 2.5rem;
      border-radius: var(--radius-md);
      border: 1px solid var(--border-color);
      background-color: var(--bg-surface);
      color: var(--text-main);
      font-size: 0.95rem;
      outline: none;
      transition: var(--transition);
    }}
    .search-input:focus {{
      border-color: var(--brand);
      box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
    }}

    .search-icon {{
      position: absolute;
      left: 0.85rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--text-muted);
      pointer-events: none;
    }}

    .count-indicator {{
      font-size: 0.875rem;
      color: var(--text-muted);
      font-weight: 500;
    }}

    /* Formula Cards */
    .formula-grid {{
      display: grid;
      grid-template-columns: 1fr;
      gap: 1.5rem;
      margin-bottom: 3.5rem;
    }}

    .formula-card {{
      background-color: var(--bg-surface);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-lg);
      padding: 1.75rem;
      box-shadow: var(--card-shadow);
      transition: var(--transition);
    }}
    .formula-card:hover {{
      border-color: var(--border-highlight);
      box-shadow: var(--card-shadow-hover);
    }}

    .card-header {{
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 1rem;
      margin-bottom: 1rem;
      flex-wrap: wrap;
    }}

    .card-title-group {{
      display: flex;
      align-items: center;
      gap: 0.75rem;
      flex-wrap: wrap;
    }}

    .formula-name {{
      font-size: 1.5rem;
      font-weight: 700;
      letter-spacing: -0.02em;
    }}
    .formula-title-link {{
      color: var(--text-main);
    }}
    .formula-title-link:hover {{
      color: var(--brand);
    }}

    .pill {{
      display: inline-flex;
      align-items: center;
      padding: 0.25rem 0.6rem;
      border-radius: 9999px;
      font-size: 0.75rem;
      font-weight: 600;
      line-height: 1;
    }}
    .pill-version {{
      background: rgba(37, 99, 235, 0.1);
      color: var(--brand);
      border: 1px solid rgba(37, 99, 235, 0.2);
    }}
    .pill-license {{
      background: var(--pill-bg);
      color: var(--pill-text);
      border: 1px solid var(--border-color);
    }}
    .pill-platform {{
      background: var(--bg-surface-alt);
      color: var(--text-muted);
      border: 1px solid var(--border-color);
      font-size: 0.75rem;
    }}
    .pill-dep {{
      background: rgba(245, 158, 11, 0.1);
      color: var(--accent);
      border: 1px solid rgba(245, 158, 11, 0.2);
    }}

    .card-links {{
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }}

    .card-action-link {{
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
      font-size: 0.825rem;
      font-weight: 500;
      color: var(--text-muted);
      padding: 0.35rem 0.6rem;
      border-radius: var(--radius-sm);
      border: 1px solid var(--border-color);
      background: var(--bg-surface-alt);
    }}
    .card-action-link:hover {{
      color: var(--brand);
      border-color: var(--brand);
    }}

    .formula-desc {{
      font-size: 1.05rem;
      color: var(--text-muted);
      margin-bottom: 1.25rem;
      line-height: 1.5;
    }}

    /* Terminal Install Command */
    .terminal-install {{
      background-color: var(--code-bg);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-md);
      padding: 0.75rem 1rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 1rem;
      margin-bottom: 1.25rem;
    }}

    .terminal-cmd {{
      display: flex;
      align-items: center;
      gap: 0.6rem;
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
      font-size: 0.9rem;
      color: var(--code-text);
      overflow-x: auto;
    }}

    .terminal-prompt {{
      color: #10b981;
      font-weight: 700;
      user-select: none;
    }}

    .btn-copy-install {{
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.18);
      color: #ffffff;
      padding: 0.35rem 0.65rem;
      border-radius: var(--radius-sm);
      font-size: 0.75rem;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      white-space: nowrap;
    }}
    .btn-copy-install:hover {{
      background: rgba(255, 255, 255, 0.2);
    }}

    /* Card Meta */
    .card-meta {{
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
      margin-bottom: 1.25rem;
    }}

    .card-meta-item {{
      display: flex;
      align-items: center;
      gap: 0.75rem;
      flex-wrap: wrap;
    }}

    .meta-label {{
      font-size: 0.825rem;
      font-weight: 600;
      color: var(--text-muted);
      min-width: 90px;
    }}

    .pills-container {{
      display: flex;
      align-items: center;
      gap: 0.5rem;
      flex-wrap: wrap;
    }}

    .inline-code {{
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
      font-size: 0.825rem;
      background: var(--bg-surface-alt);
      border: 1px solid var(--border-color);
      padding: 0.15rem 0.4rem;
      border-radius: var(--radius-sm);
    }}

    /* Accordion */
    .accordion {{
      border: 1px solid var(--border-color);
      border-radius: var(--radius-md);
      overflow: hidden;
      background-color: var(--bg-surface-alt);
    }}

    .accordion-summary {{
      padding: 0.75rem 1rem;
      font-size: 0.85rem;
      font-weight: 600;
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
      user-select: none;
      list-style: none;
    }}
    .accordion-summary::-webkit-details-marker {{
      display: none;
    }}

    .accordion-chevron {{
      transition: transform 0.2s ease;
    }}
    .accordion[open] .accordion-chevron {{
      transform: rotate(180deg);
    }}

    .accordion-content {{
      padding: 0.75rem 1rem;
      background-color: var(--bg-surface);
      border-top: 1px solid var(--border-color);
    }}

    .table-responsive {{
      overflow-x: auto;
    }}

    .table {{
      width: 100%;
      border-collapse: collapse;
      font-size: 0.825rem;
      text-align: left;
    }}
    .table th, .table td {{
      padding: 0.6rem 0.75rem;
      border-bottom: 1px solid var(--border-color);
    }}
    .table th {{
      color: var(--text-muted);
      font-weight: 600;
    }}

    .hash-row {{
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }}

    .hash-code {{
      font-family: ui-monospace, SFMono-Regular, monospace;
      font-size: 0.75rem;
      color: var(--text-muted);
    }}

    .btn-copy-hash {{
      background: none;
      border: none;
      color: var(--text-muted);
      cursor: pointer;
      padding: 2px;
      display: inline-flex;
      align-items: center;
      transition: var(--transition);
    }}
    .btn-copy-hash:hover {{
      color: var(--brand);
    }}

    /* Caveats */
    .caveats-box {{
      background: rgba(245, 158, 11, 0.08);
      border: 1px solid rgba(245, 158, 11, 0.25);
      border-radius: var(--radius-md);
      padding: 0.75rem 1rem;
      margin-bottom: 1rem;
    }}
    .caveats-box .section-title {{
      font-size: 0.8rem;
      font-weight: 700;
      color: var(--accent);
      margin-bottom: 0.35rem;
    }}
    .code-block {{
      font-family: ui-monospace, SFMono-Regular, monospace;
      font-size: 0.8rem;
      white-space: pre-wrap;
      word-break: break-word;
    }}

    /* No Results Message */
    .no-results {{
      text-align: center;
      padding: 3rem 1rem;
      background: var(--bg-surface);
      border: 1px dashed var(--border-color);
      border-radius: var(--radius-lg);
      display: none;
    }}
    .no-results-title {{
      font-size: 1.15rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
    }}

    /* Footer */
    .site-footer {{
      margin-top: auto;
      background-color: var(--bg-surface);
      border-top: 1px solid var(--border-color);
      padding: 2.5rem 0;
      font-size: 0.875rem;
      color: var(--text-muted);
      text-align: center;
    }}

    .footer-content {{
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 0.75rem;
    }}

    .footer-links {{
      display: flex;
      gap: 1.5rem;
      list-style: none;
    }}

    /* Toast Notification */
    .toast {{
      position: fixed;
      bottom: 2rem;
      right: 2rem;
      background: #0f172a;
      color: #ffffff;
      padding: 0.75rem 1.25rem;
      border-radius: var(--radius-md);
      box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.3);
      font-size: 0.875rem;
      font-weight: 500;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      transform: translateY(150%);
      opacity: 0;
      transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1), opacity 0.3s ease;
      z-index: 1000;
    }}
    .toast.show {{
      transform: translateY(0);
      opacity: 1;
    }}
  </style>
</head>
<body>
  <header class="site-header">
    <div class="container nav-wrapper">
      <div class="site-logo">
        <span class="beer-icon">🍺</span>
        <span>{html.escape(tap_name)}</span>
      </div>
      <div class="nav-actions">
        <button id="themeToggle" class="nav-btn" aria-label="Toggle Dark / Light Theme" title="Toggle theme">
          <span id="themeIcon">🌓</span>
          <span id="themeLabel">Theme</span>
        </button>
        <a href="{html.escape(repo_url)}" class="nav-btn" target="_blank" rel="noopener">
          <svg class="icon" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><path d="M8 0c4.42 0 8 3.58 8 8a8.013 8.013 0 0 1-5.45 7.59c-.4.08-.55-.17-.55-.38 0-.27.01-1.13.01-2.2 0-.75-.25-1.23-.54-1.48 1.78-.2 3.65-.88 3.65-3.95 0-.88-.31-1.59-.82-2.15.08-.2.36-1.02-.08-2.12 0 0-.67-.22-2.2.82-.64-.18-1.32-.27-2-.27-.68 0-1.36.09-2 .27-1.53-1.03-2.2-.82-2.2-.82-.44 1.1-.16 1.92-.08 2.12-.51.56-.82 1.28-.82 2.15 0 3.06 1.86 3.75 3.64 3.95-.23.2-.44.55-.51 1.07-.46.21-1.61.55-2.33-.66-.15-.24-.6-.83-1.23-.82-.67.01-.27.38.01.53.34.19.73.9.82 1.13.16.45.68 1.31 2.69.94 0 .67.01 1.3.01 1.49 0 .21-.15.45-.55.38A7.995 7.995 0 0 1 0 8c0-4.42 3.58-8 8-8Z"></path></svg>
          <span>GitHub</span>
        </a>
      </div>
    </div>
  </header>

  <main class="container">
    <section class="hero">
      <div class="hero-badge">Homebrew Package Tap</div>
      <h1 class="hero-title">{html.escape(tap_name)}</h1>
      <p class="hero-subtitle">Official Homebrew tap repository providing custom tools, utilities, and applications.</p>

      <div class="tap-install-banner">
        <div class="tap-command-group">
          <span class="prompt-sym">$</span>
          <span>brew tap {html.escape(tap_name)}</span>
        </div>
        <button class="btn-copy-global" data-copy="brew tap {html.escape(tap_name)}" aria-label="Copy tap command">
          <svg viewBox="0 0 16 16" width="14" height="14" fill="currentColor"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"></path><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"></path></svg>
          <span>Copy Tap Command</span>
        </button>
      </div>
    </section>

    <div class="controls-bar">
      <div class="search-box">
        <svg class="search-icon" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><path d="M10.68 11.74a6 6 0 0 1-7.922-8.982 6 6 0 0 1 8.982 7.922l3.04 3.04a.749.749 0 0 1-.326 1.275.749.749 0 0 1-.734-.215ZM11.5 7a4.499 4.499 0 1 0-8.997 0A4.499 4.499 0 0 0 11.5 7Z"></path></svg>
        <input type="text" id="searchInput" class="search-input" placeholder="Filter formulas by name, description, license..." autocomplete="off">
      </div>
      <div id="countIndicator" class="count-indicator">Showing {len(formulas)} of {len(formulas)} formulas</div>
    </div>

    <section id="formulaGrid" class="formula-grid">
      {all_cards_str}
    </section>

    <div id="noResults" class="no-results">
      <div class="no-results-title">No matching formulas found</div>
      <p class="text-muted">Try adjusting your search query or clear the filter.</p>
    </div>
  </main>

  <footer class="site-footer">
    <div class="container footer-content">
      <ul class="footer-links">
        <li><a href="{html.escape(repo_url)}" target="_blank" rel="noopener">GitHub Repository</a></li>
        <li><a href="https://brew.sh" target="_blank" rel="noopener">Homebrew Documentation</a></li>
        <li><a href="{html.escape(repo_url)}/issues" target="_blank" rel="noopener">Report Issue</a></li>
      </ul>
      <p>Tap updated automatically on every commit to <code>Formula/*.rb</code> via GitHub Actions.</p>
      <p>Last generated: <code>{now_str}</code></p>
    </div>
  </footer>

  <div id="toast" class="toast" role="status" aria-live="polite">
    <svg viewBox="0 0 16 16" width="16" height="16" fill="#10b981"><path d="M13.78 4.22a.75.75 0 0 1 0 1.06l-7.25 7.25a.75.75 0 0 1-1.06 0L2.22 9.28a.751.751 0 0 1 .018-1.042.751.751 0 0 1 1.042-.018L6 10.94l6.72-6.72a.75.75 0 0 1 1.06 0Z"></path></svg>
    <span id="toastMessage">Copied to clipboard!</span>
  </div>

  <script>
    // Copy-to-clipboard functionality with toast notification
    const toast = document.getElementById('toast');
    const toastMsg = document.getElementById('toastMessage');
    let toastTimeout;

    function showToast(message) {{
      clearTimeout(toastTimeout);
      toastMsg.textContent = message;
      toast.classList.add('show');
      toastTimeout = setTimeout(() => {{
        toast.classList.remove('show');
      }}, 2400);
    }}

    function copyText(text, label = "Copied to clipboard!") {{
      if (navigator.clipboard && window.isSecureContext) {{
        navigator.clipboard.writeText(text).then(() => showToast(label)).catch(() => fallbackCopy(text, label));
      }} else {{
        fallbackCopy(text, label);
      }}
    }}

    function fallbackCopy(text, label) {{
      const textArea = document.createElement("textarea");
      textArea.value = text;
      textArea.style.position = "fixed";
      textArea.style.opacity = "0";
      document.body.appendChild(textArea);
      textArea.select();
      try {{
        document.execCommand('copy');
        showToast(label);
      }} catch (err) {{
        showToast("Press Ctrl+C to copy");
      }}
      document.body.removeChild(textArea);
    }}

    // Global copy button handler
    document.querySelectorAll('[data-copy]').forEach(btn => {{
      btn.addEventListener('click', (e) => {{
        e.preventDefault();
        const text = btn.getAttribute('data-copy');
        copyText(text, "Command copied!");
      }});
    }});

    // Instant Search & Filter
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('.formula-card');
    const countIndicator = document.getElementById('countIndicator');
    const noResults = document.getElementById('noResults');
    const totalCount = cards.length;

    searchInput.addEventListener('input', (e) => {{
      const query = e.target.value.trim().toLowerCase();
      let visible = 0;

      cards.forEach(card => {{
        const keywords = card.getAttribute('data-keywords') || '';
        if (keywords.includes(query)) {{
          card.style.display = '';
          visible++;
        }} else {{
          card.style.display = 'none';
        }}
      }});

      countIndicator.textContent = `Showing ${{visible}} of ${{totalCount}} ${{totalCount === 1 ? 'formula' : 'formulas'}}`;
      noResults.style.display = visible === 0 ? 'block' : 'none';
    }});

    // Modern 2-state Theme Switcher conforming to modern-web-guidance
    const themeToggle = document.getElementById('themeToggle');
    const themeIcon = document.getElementById('themeIcon');
    const themeLabel = document.getElementById('themeLabel');

    function updateThemeUI() {{
      const isDark = document.documentElement.getAttribute('data-theme') === 'dark' ||
        (!document.documentElement.getAttribute('data-theme') && window.matchMedia('(prefers-color-scheme: dark)').matches);
      themeIcon.textContent = isDark ? '☀️' : '🌙';
      themeLabel.textContent = isDark ? 'Light' : 'Dark';
    }}

    themeToggle.addEventListener('click', () => {{
      const currentTheme = document.documentElement.getAttribute('data-theme');
      let targetTheme;
      if (currentTheme) {{
        targetTheme = currentTheme === 'dark' ? 'light' : 'dark';
      }} else {{
        targetTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'light' : 'dark';
      }}

      document.documentElement.setAttribute('data-theme', targetTheme);
      localStorage.setItem('theme', targetTheme);
      updateThemeUI();
    }});

    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {{
      if (!localStorage.getItem('theme')) {{
        updateThemeUI();
      }}
    }});

    updateThemeUI();
  </script>
</body>
</html>
"""
        return html_template


def main():
    root_dir = Path(__file__).resolve().parent.parent
    formula_dir = root_dir / "Formula"
    site_dir = root_dir / "_site"
    readme_path = root_dir / "README.md"

    if not formula_dir.exists():
        print(f"Error: {formula_dir} does not exist", file=sys.stderr)
        sys.exit(1)

    formula_files = sorted(list(formula_dir.glob("*.rb")))
    if not formula_files:
        print(f"Warning: No *.rb files found in {formula_dir}", file=sys.stderr)

    formulas: List[Formula] = []
    for fpath in formula_files:
        parsed = FormulaParser.parse_file(fpath)
        if parsed:
            formulas.append(parsed)
            print(f"✔ Successfully parsed {fpath.name} (v{parsed.version})")

    owner, repo, tap_name = get_repo_info()
    print(f"Repository: {owner}/{repo} (Tap: {tap_name})")

    # Generate README.md
    readme_content = ReadmeGenerator.generate(owner, repo, tap_name, formulas)
    readme_path.write_text(readme_content, encoding="utf-8")
    print(f"✔ Generated {readme_path} ({len(formulas)} formulas documented)")

    # Generate _site/index.html
    site_dir.mkdir(parents=True, exist_ok=True)
    html_content = HtmlGenerator.generate(owner, repo, tap_name, formulas)
    (site_dir / "index.html").write_text(html_content, encoding="utf-8")
    # Also write .nojekyll so GitHub Pages does not run Jekyll processing
    (site_dir / ".nojekyll").write_text("", encoding="utf-8")
    print(f"✔ Generated {site_dir / 'index.html'} and {site_dir / '.nojekyll'}")


if __name__ == "__main__":
    main()
