# smford/tap

[![Documentation & Pages](https://github.com/smford/homebrew-tap/actions/workflows/docs-and-pages.yml/badge.svg)](https://github.com/smford/homebrew-tap/actions/workflows/docs-and-pages.yml)
[![GitHub Pages](https://img.shields.io/badge/docs-GitHub%20Pages-2563eb.svg)](https://smford.github.io/homebrew-tap/)
![Formulas Count](https://img.shields.io/badge/formulas-9-10b981.svg)

Official [Homebrew](https://brew.sh/) tap for [smford](https://github.com/smford/homebrew-tap).
Browse the interactive documentation and web catalog at **[https://smford.github.io/homebrew-tap/](https://smford.github.io/homebrew-tap/)**.

## 📦 Installation & Usage

### Method 1: Tap repository (Recommended)

Add this tap once to Homebrew, then install any package directly by its formula name:

```bash
# Add this tap to your Homebrew installation
brew tap smford/tap

# Install a formula (e.g. cam-proxy)
brew install cam-proxy
```

### Method 2: Single command install

Install a formula without explicitly tapping the repository:

```bash
brew install smford/tap/<formula>
```

---

## 📋 Available Formulas

| Formula | Description | Version | License | Platforms | Quick Install |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [`cam-proxy`](#cam-proxy) | Lightweight edge camera gateway — snapshots, PTZ control, and ONVIF-to-MQTT events | `0.4.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/cam-proxy` |
| [`cidr-calculator`](#cidr-calculator) | Convert IP ranges into minimal CIDR blocks with subnet intelligence | `1.0.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/cidr-calculator` |
| [`delim`](#delim) | Creates a visual line to aid in reading terminal screens | `0.2.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/delim` |
| [`gh-stats`](#gh-stats) | SRE & developer reliability statistics for GitHub PRs and repositories | `0.11.3` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/gh-stats` |
| [`matrix-rain`](#matrix-rain) | Authentic Matrix digital rain terminal simulator written in Go | `1.1.0` | `MIT` | macOS, Linux | `brew install smford/tap/matrix-rain` |
| [`mcat`](#mcat) | Authentic Matrix digital rain terminal simulator and text viewer written in Go | `1.2.0` | `MIT` | macOS, Linux | `brew install smford/tap/mcat` |
| [`mdee`](#mdee) | Terminal Markdown viewer for macOS iTerm2 | `1.8.2` | `AGPL-3.0-or-later` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/mdee` |
| [`osx-traffic-stats`](#osx-traffic-stats) | Real-time macOS menu bar network traffic monitor | `1.2.3` | `MIT` | macOS (Apple Silicon & Intel) | `brew install smford/tap/osx-traffic-stats` |
| [`tf-blast`](#tf-blast) | Ultra-fast, zero-trust blast radius analyzer for Terraform and OpenTofu | `1.2.2` | `AGPL-3.0-or-later` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/tf-blast` |

---

## 🔍 Formula Details

### `cam-proxy`

**Description:** Lightweight edge camera gateway — snapshots, PTZ control, and ONVIF-to-MQTT events  
**Homepage:** [https://github.com/smford/cam-proxy](https://github.com/smford/cam-proxy)  
**Version:** `0.4.0`  
**License:** `MIT`  
**Source:** [`Formula/cam-proxy.rb`](Formula/cam-proxy.rb)  

**Install:**
```bash
brew install smford/tap/cam-proxy
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`cam-proxy_0.4.0_darwin_arm64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.0/cam-proxy_0.4.0_darwin_arm64.tar.gz) | `bc9264298a81f55d...` |
| macOS (Intel (x86_64)) | [`cam-proxy_0.4.0_darwin_amd64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.0/cam-proxy_0.4.0_darwin_amd64.tar.gz) | `101868c1c42f9e10...` |
| Linux (ARM64) | [`cam-proxy_0.4.0_linux_arm64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.0/cam-proxy_0.4.0_linux_arm64.tar.gz) | `fc24be78bcfc806f...` |
| Linux (x86_64) | [`cam-proxy_0.4.0_linux_amd64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.0/cam-proxy_0.4.0_linux_amd64.tar.gz) | `71f77f4a98d4a655...` |

**Installed Binaries:** `cam-proxy`  

**Verification & Update:**
```bash
brew test cam-proxy       # Run formula self-tests
brew upgrade cam-proxy    # Upgrade to the latest version
```

---

### `cidr-calculator`

**Description:** Convert IP ranges into minimal CIDR blocks with subnet intelligence  
**Homepage:** [https://github.com/smford/cidr-calculator](https://github.com/smford/cidr-calculator)  
**Version:** `1.0.0`  
**License:** `MIT`  
**Source:** [`Formula/cidr-calculator.rb`](Formula/cidr-calculator.rb)  

**Install:**
```bash
brew install smford/tap/cidr-calculator
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`cidr-calculator_1.0.0_darwin_arm64.tar.gz`](https://github.com/smford/cidr-calculator/releases/download/v1.0.0/cidr-calculator_1.0.0_darwin_arm64.tar.gz) | `bd3e4eb490af0ee8...` |
| macOS (Intel (x86_64)) | [`cidr-calculator_1.0.0_darwin_amd64.tar.gz`](https://github.com/smford/cidr-calculator/releases/download/v1.0.0/cidr-calculator_1.0.0_darwin_amd64.tar.gz) | `c101090c627014d8...` |
| Linux (ARM64) | [`cidr-calculator_1.0.0_linux_arm64.tar.gz`](https://github.com/smford/cidr-calculator/releases/download/v1.0.0/cidr-calculator_1.0.0_linux_arm64.tar.gz) | `5ab414570c52ffbc...` |
| Linux (x86_64) | [`cidr-calculator_1.0.0_linux_amd64.tar.gz`](https://github.com/smford/cidr-calculator/releases/download/v1.0.0/cidr-calculator_1.0.0_linux_amd64.tar.gz) | `6a4113163b27a0d7...` |

**Installed Binaries:** `cidr-calculator`  

**Verification & Update:**
```bash
brew test cidr-calculator       # Run formula self-tests
brew upgrade cidr-calculator    # Upgrade to the latest version
```

---

### `delim`

**Description:** Creates a visual line to aid in reading terminal screens  
**Homepage:** [https://github.com/smford/delim](https://github.com/smford/delim)  
**Version:** `0.2.0`  
**License:** `MIT`  
**Source:** [`Formula/delim.rb`](Formula/delim.rb)  

**Install:**
```bash
brew install smford/tap/delim
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`delim-v0.2.0-darwin-arm64.tar.gz`](https://github.com/smford/delim/releases/download/v0.2.0/delim-v0.2.0-darwin-arm64.tar.gz) | `29988ddf0b4038b4...` |
| macOS (Intel (x86_64)) | [`delim-v0.2.0-darwin-amd64.tar.gz`](https://github.com/smford/delim/releases/download/v0.2.0/delim-v0.2.0-darwin-amd64.tar.gz) | `d73bb33c07cf7fa4...` |
| Linux (ARM64) | [`delim-v0.2.0-linux-arm64.tar.gz`](https://github.com/smford/delim/releases/download/v0.2.0/delim-v0.2.0-linux-arm64.tar.gz) | `1138e1b626e7ad36...` |
| Linux (x86_64) | [`delim-v0.2.0-linux-amd64.tar.gz`](https://github.com/smford/delim/releases/download/v0.2.0/delim-v0.2.0-linux-amd64.tar.gz) | `29d9d067e5caf8ec...` |

**Installed Binaries:** `delim`  

**Verification & Update:**
```bash
brew test delim       # Run formula self-tests
brew upgrade delim    # Upgrade to the latest version
```

---

### `gh-stats`

**Description:** SRE & developer reliability statistics for GitHub PRs and repositories  
**Homepage:** [https://github.com/smford/gh-stats](https://github.com/smford/gh-stats)  
**Version:** `0.11.3`  
**License:** `MIT`  
**Source:** [`Formula/gh-stats.rb`](Formula/gh-stats.rb)  

**Install:**
```bash
brew install smford/tap/gh-stats
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`gh-stats_0.11.3_darwin_arm64.tar.gz`](https://github.com/smford/gh-stats/releases/download/v0.11.3/gh-stats_0.11.3_darwin_arm64.tar.gz) | `800fba8b36b326ab...` |
| macOS (Intel (x86_64)) | [`gh-stats_0.11.3_darwin_amd64.tar.gz`](https://github.com/smford/gh-stats/releases/download/v0.11.3/gh-stats_0.11.3_darwin_amd64.tar.gz) | `3d7659e5869a56fb...` |
| Linux (ARM64) | [`gh-stats_0.11.3_linux_arm64.tar.gz`](https://github.com/smford/gh-stats/releases/download/v0.11.3/gh-stats_0.11.3_linux_arm64.tar.gz) | `c1209760d64fdc24...` |
| Linux (x86_64) | [`gh-stats_0.11.3_linux_amd64.tar.gz`](https://github.com/smford/gh-stats/releases/download/v0.11.3/gh-stats_0.11.3_linux_amd64.tar.gz) | `b7346f15c6ce6f0f...` |

**Installed Binaries:** `gh-stats`  

**Verification & Update:**
```bash
brew test gh-stats       # Run formula self-tests
brew upgrade gh-stats    # Upgrade to the latest version
```

---

### `matrix-rain`

**Description:** Authentic Matrix digital rain terminal simulator written in Go  
**Homepage:** [https://smford.github.io/matrix-rain](https://smford.github.io/matrix-rain)  
**Version:** `1.1.0`  
**License:** `MIT`  
**Source:** [`Formula/matrix-rain.rb`](Formula/matrix-rain.rb)  

**Install:**
```bash
brew install smford/tap/matrix-rain
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| Universal (All) | [`matrix-rain_1.1.0_darwin_amd64.tar.gz`](https://github.com/smford/matrix-rain/releases/download/v1.1.0/matrix-rain_1.1.0_darwin_amd64.tar.gz) | `7ea9582ddad80795...` |

**Installed Binaries:** `matrix-rain`, `matrix-rain`, `matrix-rain`, `matrix-rain`  

**Verification & Update:**
```bash
brew test matrix-rain       # Run formula self-tests
brew upgrade matrix-rain    # Upgrade to the latest version
```

---

### `mcat`

**Description:** Authentic Matrix digital rain terminal simulator and text viewer written in Go  
**Homepage:** [https://smford.github.io/matrix-cat](https://smford.github.io/matrix-cat)  
**Version:** `1.2.0`  
**License:** `MIT`  
**Source:** [`Formula/mcat.rb`](Formula/mcat.rb)  

**Install:**
```bash
brew install smford/tap/mcat
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| Universal (All) | [`mcat_1.2.0_darwin_amd64.tar.gz`](https://github.com/smford/matrix-cat/releases/download/v1.2.0/mcat_1.2.0_darwin_amd64.tar.gz) | `072e075d9a16afd3...` |

**Installed Binaries:** `mcat`, `mcat`, `mcat`, `mcat`  

**Verification & Update:**
```bash
brew test mcat       # Run formula self-tests
brew upgrade mcat    # Upgrade to the latest version
```

---

### `mdee`

**Description:** Terminal Markdown viewer for macOS iTerm2  
**Homepage:** [https://github.com/smford/mdee](https://github.com/smford/mdee)  
**Version:** `1.8.2`  
**License:** `AGPL-3.0-or-later`  
**Source:** [`Formula/mdee.rb`](Formula/mdee.rb)  

**Install:**
```bash
brew install smford/tap/mdee
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`mdee-v1.8.2-darwin-arm64.tar.gz`](https://github.com/smford/mdee/releases/download/v1.8.2/mdee-v1.8.2-darwin-arm64.tar.gz) | `5e9a5a2bd6b7ad88...` |
| macOS (Intel (x86_64)) | [`mdee-v1.8.2-darwin-amd64.tar.gz`](https://github.com/smford/mdee/releases/download/v1.8.2/mdee-v1.8.2-darwin-amd64.tar.gz) | `cce5669234a1cf7f...` |
| Linux (ARM64) | [`mdee-v1.8.2-linux-arm64.tar.gz`](https://github.com/smford/mdee/releases/download/v1.8.2/mdee-v1.8.2-linux-arm64.tar.gz) | `514b803ecbcbfe9e...` |
| Linux (x86_64) | [`mdee-v1.8.2-linux-amd64.tar.gz`](https://github.com/smford/mdee/releases/download/v1.8.2/mdee-v1.8.2-linux-amd64.tar.gz) | `fca10136ba652f73...` |

**Installed Binaries:** `mdee`  

**Verification & Update:**
```bash
brew test mdee       # Run formula self-tests
brew upgrade mdee    # Upgrade to the latest version
```

---

### `osx-traffic-stats`

**Description:** Real-time macOS menu bar network traffic monitor  
**Homepage:** [https://github.com/smford/osx-traffic-stats](https://github.com/smford/osx-traffic-stats)  
**Version:** `1.2.3`  
**License:** `MIT`  
**Source:** [`Formula/osx-traffic-stats.rb`](Formula/osx-traffic-stats.rb)  

**Install:**
```bash
brew install smford/tap/osx-traffic-stats
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`osx-traffic-stats-v1.2.3-darwin-universal.tar.gz`](https://github.com/smford/osx-traffic-stats/releases/download/v1.2.3/osx-traffic-stats-v1.2.3-darwin-universal.tar.gz) | `51aad95e00b8e6ba...` |
| macOS (Intel (x86_64)) | [`osx-traffic-stats-v1.2.3-darwin-universal.tar.gz`](https://github.com/smford/osx-traffic-stats/releases/download/v1.2.3/osx-traffic-stats-v1.2.3-darwin-universal.tar.gz) | `51aad95e00b8e6ba...` |

**Installed Binaries:** `osx-traffic-stats`  

**Dependencies:** `macos`  

**Verification & Update:**
```bash
brew test osx-traffic-stats       # Run formula self-tests
brew upgrade osx-traffic-stats    # Upgrade to the latest version
```

---

### `tf-blast`

**Description:** Ultra-fast, zero-trust blast radius analyzer for Terraform and OpenTofu  
**Homepage:** [https://github.com/smford/tf-blast](https://github.com/smford/tf-blast)  
**Version:** `1.2.2`  
**License:** `AGPL-3.0-or-later`  
**Source:** [`Formula/tf-blast.rb`](Formula/tf-blast.rb)  

**Install:**
```bash
brew install smford/tap/tf-blast
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`tf-blast_1.2.2_darwin_arm64.tar.gz`](https://github.com/smford/tf-blast/releases/download/v1.2.2/tf-blast_1.2.2_darwin_arm64.tar.gz) | `330a3828735a6d14...` |
| macOS (Intel (x86_64)) | [`tf-blast_1.2.2_darwin_amd64.tar.gz`](https://github.com/smford/tf-blast/releases/download/v1.2.2/tf-blast_1.2.2_darwin_amd64.tar.gz) | `0ff1ad6c2419e055...` |
| Linux (ARM64) | [`tf-blast_1.2.2_linux_arm64.tar.gz`](https://github.com/smford/tf-blast/releases/download/v1.2.2/tf-blast_1.2.2_linux_arm64.tar.gz) | `b7259f63fdae976a...` |
| Linux (x86_64) | [`tf-blast_1.2.2_linux_amd64.tar.gz`](https://github.com/smford/tf-blast/releases/download/v1.2.2/tf-blast_1.2.2_linux_amd64.tar.gz) | `7c95d9711375b933...` |

**Installed Binaries:** `tf-blast`  

**Verification & Update:**
```bash
brew test tf-blast       # Run formula self-tests
brew upgrade tf-blast    # Upgrade to the latest version
```

---

## 🛠 Maintenance & Tap Commands

```bash
# Update Homebrew formula definitions and check for upgrades
brew update

# Upgrade all installed packages from this tap
brew upgrade

# Remove a package
brew uninstall <formula>

# Untap this repository
brew untap smford/tap
```

## 🤖 Automated CI/CD

This repository uses **GitHub Actions** to automatically update documentation whenever a formula in `Formula/*.rb` is modified:
- Updates and formats `README.md`
- Builds and deploys the static GitHub Page to [https://smford.github.io/homebrew-tap/](https://smford.github.io/homebrew-tap/)

---
<sub>Documentation automatically generated on `2026-10-04 16:51:51 UTC`.</sub>
