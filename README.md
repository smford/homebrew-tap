# smford/tap

[![Documentation & Pages](https://github.com/smford/homebrew-tap/actions/workflows/docs-and-pages.yml/badge.svg)](https://github.com/smford/homebrew-tap/actions/workflows/docs-and-pages.yml) [![GitHub Pages](https://img.shields.io/badge/docs-GitHub%20Pages-2563eb.svg)](https://smford.github.io/homebrew-tap/) ![Formulas Count](https://img.shields.io/badge/formulas-23-10b981.svg) ![Casks Count](https://img.shields.io/badge/casks-1-8b5cf6.svg)

Official [Homebrew](https://brew.sh/) tap for [smford](https://github.com/smford/homebrew-tap).
Browse the interactive documentation and web catalog at **[https://smford.github.io/homebrew-tap/](https://smford.github.io/homebrew-tap/)**.

## 📦 Installation & Usage

### Method 1: Tap repository (Recommended)

Add this tap once to Homebrew, then install any formula or cask directly:

```bash
# Add this tap to your Homebrew installation
brew tap smford/tap

# Install a command-line formula (CLI tool)
brew install aws-cost-report

# Install a cask (macOS GUI application)
brew install --cask osx-traffic-stats
```

### Method 2: Single command install

Install a formula or cask without explicitly tapping the repository:

```bash
# Install a formula
brew install smford/tap/<formula>

# Install a cask
brew install --cask smford/tap/<cask>
```

---

## 📋 Available Formulas

| Formula | Description | Version | License | Platforms | Quick Install |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [`aws-cost-report`](#aws-cost-report) | AWS Cost & Usage reporting CLI and service | `latest` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/aws-cost-report` |
| [`cam-proxy`](#cam-proxy) | Lightweight edge camera gateway — snapshots, PTZ control, and ONVIF-to-MQTT events | `0.4.1` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/cam-proxy` |
| [`cert-chain-doctor`](#cert-chain-doctor) | Visual TLS handshake & intermediate certificate chain debugger and AIA auto-repairer | `0.1.1` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/cert-chain-doctor` |
| [`chrome-tab-cleaner`](#chrome-tab-cleaner) | Terminal UI for macOS to inspect Chrome tabs by Memory/CPU and bring them to focus | `0.1.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/chrome-tab-cleaner` |
| [`cidr-calculator`](#cidr-calculator) | Convert IP ranges into minimal CIDR blocks with subnet intelligence | `1.0.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/cidr-calculator` |
| [`delim`](#delim) | Creates a visual line to aid in reading terminal screens | `0.2.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/delim` |
| [`domain-doctor`](#domain-doctor) | Comprehensive domain health, DNS diagnostic, and TLS autopsy CLI tool | `0.2.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/domain-doctor` |
| [`gh-stats`](#gh-stats) | SRE & developer reliability statistics for GitHub PRs and repositories | `0.11.3` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/gh-stats` |
| [`gha-local-lint`](#gha-local-lint) | Offline GitHub Actions Expression Evaluator, Matrix Expander, & Pipeline Simulator | `0.5.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/gha-local-lint` |
| [`iam-shrink`](#iam-shrink) | Local-to-Least-Privilege AWS IAM Policy Generator | `0.6.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/iam-shrink` |
| [`imds-canary`](#imds-canary) | eBPF AWS IMDS Canary & Process Attribution Daemon | `0.1.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/imds-canary` |
| [`matrix-rain`](#matrix-rain) | Authentic Matrix digital rain terminal simulator written in Go | `1.1.0` | `MIT` | macOS, Linux | `brew install smford/tap/matrix-rain` |
| [`mcat`](#mcat) | Authentic Matrix digital rain terminal simulator and text viewer written in Go | `1.2.0` | `MIT` | macOS, Linux | `brew install smford/tap/mcat` |
| [`mcp-jail`](#mcp-jail) | Lightweight security proxy and flight recorder for Model Context Protocol (MCP) servers | `0.6.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/mcp-jail` |
| [`mdee`](#mdee) | Terminal Markdown viewer for macOS iTerm2 | `1.8.2` | `AGPL-3.0-or-later` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/mdee` |
| [`onvif-camera-simulator`](#onvif-camera-simulator) | Pure Go ONVIF Profile S/T/M and RTSP camera simulator with virtual PTZ and fleet scaling | `0.2.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/onvif-camera-simulator` |
| [`onvif-inspector`](#onvif-inspector) | Real-time ONVIF IP camera event diagnostic utility and terminal inspector | `1.0.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/onvif-inspector` |
| [`term2svg`](#term2svg) | Render terminal commands, ANSI streams, tmux panes, and screen models to vector SVGs | `0.1.0` | `MIT` | macOS, Linux | `brew install smford/tap/term2svg` |
| [`termtosvg`](#termtosvg) | Render gorgeous, pixel-perfect SVGs from terminal commands, live screens, or ANSI logs | `0.1.1` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/termtosvg` |
| [`tf-blast`](#tf-blast) | Ultra-fast, zero-trust blast radius analyzer for Terraform and OpenTofu | `1.2.2` | `AGPL-3.0-or-later` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/tf-blast` |
| [`tf-move-gen`](#tf-move-gen) | Automated refactoring generator for Terraform and OpenTofu moved blocks | `0.1.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/tf-move-gen` |
| [`video-amplifier`](#video-amplifier) | High-performance streaming proxy for IP cameras with zero-transcode fan-out | `1.0.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/video-amplifier` |
| [`webhook-replay-proxy`](#webhook-replay-proxy) | Production-grade webhook capture, replay, and inspection proxy | `0.2.1` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/webhook-replay-proxy` |

---

## 📱 Available Casks

| Cask | Application | Description | Version | Quick Install |
| :--- | :--- | :--- | :--- | :--- |
| [`osx-traffic-stats`](#osx-traffic-stats) | OSX Traffic Stats | Real-time macOS menu bar network traffic monitor | `1.3.0` | `brew install --cask smford/tap/osx-traffic-stats` |

---

## 🔍 Formula Details

### `aws-cost-report`

**Description:** AWS Cost & Usage reporting CLI and service  
**Homepage:** [https://github.com/smford/aws-cost-report](https://github.com/smford/aws-cost-report)  
**Version:** `latest`  
**License:** `MIT`  
**Source:** [`Formula/aws-cost-report.rb`](Formula/aws-cost-report.rb)  

**Install:**
```bash
brew install smford/tap/aws-cost-report
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`aws-cost-report_0.9.0_darwin_arm64.tar.gz`](https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_darwin_arm64.tar.gz) | `51303e1e5853adbe...` |
| macOS (Intel (x86_64)) | [`aws-cost-report_0.9.0_darwin_amd64.tar.gz`](https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_darwin_amd64.tar.gz) | `33ea2838049b13d4...` |
| Linux (ARM64) | [`aws-cost-report_0.9.0_linux_arm64.tar.gz`](https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_linux_arm64.tar.gz) | `d7337183c35f9054...` |
| Linux (x86_64) | [`aws-cost-report_0.9.0_linux_amd64.tar.gz`](https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_linux_amd64.tar.gz) | `44728941cb17ea9d...` |

**Installed Binaries:** `aws-cost-report`  

**Verification & Update:**
```bash
brew test aws-cost-report       # Run formula self-tests
brew upgrade aws-cost-report    # Upgrade to the latest version
```

---

### `cam-proxy`

**Description:** Lightweight edge camera gateway — snapshots, PTZ control, and ONVIF-to-MQTT events  
**Homepage:** [https://github.com/smford/cam-proxy](https://github.com/smford/cam-proxy)  
**Version:** `0.4.1`  
**License:** `MIT`  
**Source:** [`Formula/cam-proxy.rb`](Formula/cam-proxy.rb)  

**Install:**
```bash
brew install smford/tap/cam-proxy
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`cam-proxy_0.4.1_darwin_arm64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.1/cam-proxy_0.4.1_darwin_arm64.tar.gz) | `c110871f65791f7f...` |
| macOS (Intel (x86_64)) | [`cam-proxy_0.4.1_darwin_amd64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.1/cam-proxy_0.4.1_darwin_amd64.tar.gz) | `9ab7fb2ebe0c8d8c...` |
| Linux (ARM64) | [`cam-proxy_0.4.1_linux_arm64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.1/cam-proxy_0.4.1_linux_arm64.tar.gz) | `ebdf9e8120d46b1e...` |
| Linux (x86_64) | [`cam-proxy_0.4.1_linux_amd64.tar.gz`](https://github.com/smford/cam-proxy/releases/download/v0.4.1/cam-proxy_0.4.1_linux_amd64.tar.gz) | `911d5116c7eec2f8...` |

**Installed Binaries:** `cam-proxy`  

**Verification & Update:**
```bash
brew test cam-proxy       # Run formula self-tests
brew upgrade cam-proxy    # Upgrade to the latest version
```

---

### `cert-chain-doctor`

**Description:** Visual TLS handshake & intermediate certificate chain debugger and AIA auto-repairer  
**Homepage:** [https://github.com/smford/cert-chain-doctor](https://github.com/smford/cert-chain-doctor)  
**Version:** `0.1.1`  
**License:** `MIT`  
**Source:** [`Formula/cert-chain-doctor.rb`](Formula/cert-chain-doctor.rb)  

**Install:**
```bash
brew install smford/tap/cert-chain-doctor
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`cert-chain-doctor_0.1.1_darwin_arm64.tar.gz`](https://github.com/smford/cert-chain-doctor/releases/download/v0.1.1/cert-chain-doctor_0.1.1_darwin_arm64.tar.gz) | `b62843f116ccd82c...` |
| macOS (Intel (x86_64)) | [`cert-chain-doctor_0.1.1_darwin_amd64.tar.gz`](https://github.com/smford/cert-chain-doctor/releases/download/v0.1.1/cert-chain-doctor_0.1.1_darwin_amd64.tar.gz) | `e18cfaa336cbf772...` |
| Linux (ARM64) | [`cert-chain-doctor_0.1.1_linux_arm64.tar.gz`](https://github.com/smford/cert-chain-doctor/releases/download/v0.1.1/cert-chain-doctor_0.1.1_linux_arm64.tar.gz) | `50c57b9a0aba67e0...` |
| Linux (x86_64) | [`cert-chain-doctor_0.1.1_linux_amd64.tar.gz`](https://github.com/smford/cert-chain-doctor/releases/download/v0.1.1/cert-chain-doctor_0.1.1_linux_amd64.tar.gz) | `5204217b577f2eee...` |

**Installed Binaries:** `cert-chain-doctor`  

**Verification & Update:**
```bash
brew test cert-chain-doctor       # Run formula self-tests
brew upgrade cert-chain-doctor    # Upgrade to the latest version
```

---

### `chrome-tab-cleaner`

**Description:** Terminal UI for macOS to inspect Chrome tabs by Memory/CPU and bring them to focus  
**Homepage:** [https://github.com/smford/chrome-tab-cleaner](https://github.com/smford/chrome-tab-cleaner)  
**Version:** `0.1.0`  
**License:** `MIT`  
**Source:** [`Formula/chrome-tab-cleaner.rb`](Formula/chrome-tab-cleaner.rb)  

**Install:**
```bash
brew install smford/tap/chrome-tab-cleaner
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`chrome-tab-cleaner_0.1.0_darwin_arm64.tar.gz`](https://github.com/smford/chrome-tab-cleaner/releases/download/v0.1.0/chrome-tab-cleaner_0.1.0_darwin_arm64.tar.gz) | `d7ee53f773206b3e...` |
| macOS (Intel (x86_64)) | [`chrome-tab-cleaner_0.1.0_darwin_amd64.tar.gz`](https://github.com/smford/chrome-tab-cleaner/releases/download/v0.1.0/chrome-tab-cleaner_0.1.0_darwin_amd64.tar.gz) | `288a66db2cc6c28d...` |
| Linux (ARM64) | [`chrome-tab-cleaner_0.1.0_linux_arm64.tar.gz`](https://github.com/smford/chrome-tab-cleaner/releases/download/v0.1.0/chrome-tab-cleaner_0.1.0_linux_arm64.tar.gz) | `9ab03d714c027c22...` |
| Linux (x86_64) | [`chrome-tab-cleaner_0.1.0_linux_amd64.tar.gz`](https://github.com/smford/chrome-tab-cleaner/releases/download/v0.1.0/chrome-tab-cleaner_0.1.0_linux_amd64.tar.gz) | `dd413d19fef3b6ec...` |

**Installed Binaries:** `chrome-tab-cleaner`  

**Verification & Update:**
```bash
brew test chrome-tab-cleaner       # Run formula self-tests
brew upgrade chrome-tab-cleaner    # Upgrade to the latest version
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

### `domain-doctor`

**Description:** Comprehensive domain health, DNS diagnostic, and TLS autopsy CLI tool  
**Homepage:** [https://github.com/smford/domain-doctor](https://github.com/smford/domain-doctor)  
**Version:** `0.2.0`  
**License:** `MIT`  
**Source:** [`Formula/domain-doctor.rb`](Formula/domain-doctor.rb)  

**Install:**
```bash
brew install smford/tap/domain-doctor
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`domain-doctor_0.2.0_darwin_arm64.tar.gz`](https://github.com/smford/domain-doctor/releases/download/v0.2.0/domain-doctor_0.2.0_darwin_arm64.tar.gz) | `04c2b6cf77aeccbd...` |
| macOS (Intel (x86_64)) | [`domain-doctor_0.2.0_darwin_amd64.tar.gz`](https://github.com/smford/domain-doctor/releases/download/v0.2.0/domain-doctor_0.2.0_darwin_amd64.tar.gz) | `97a4c92d3fe3c9af...` |
| Linux (ARM64) | [`domain-doctor_0.2.0_linux_arm64.tar.gz`](https://github.com/smford/domain-doctor/releases/download/v0.2.0/domain-doctor_0.2.0_linux_arm64.tar.gz) | `705d1fa61e74280b...` |
| Linux (x86_64) | [`domain-doctor_0.2.0_linux_amd64.tar.gz`](https://github.com/smford/domain-doctor/releases/download/v0.2.0/domain-doctor_0.2.0_linux_amd64.tar.gz) | `407a7d4fa840c601...` |

**Installed Binaries:** `domain-doctor`  

**Verification & Update:**
```bash
brew test domain-doctor       # Run formula self-tests
brew upgrade domain-doctor    # Upgrade to the latest version
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

### `gha-local-lint`

**Description:** Offline GitHub Actions Expression Evaluator, Matrix Expander, & Pipeline Simulator  
**Homepage:** [https://github.com/smford/gha-local-lint](https://github.com/smford/gha-local-lint)  
**Version:** `0.5.0`  
**License:** `MIT`  
**Source:** [`Formula/gha-local-lint.rb`](Formula/gha-local-lint.rb)  

**Install:**
```bash
brew install smford/tap/gha-local-lint
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`gha-local-lint_0.5.0_darwin_arm64.tar.gz`](https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_darwin_arm64.tar.gz) | `add6530941de26df...` |
| macOS (Intel (x86_64)) | [`gha-local-lint_0.5.0_darwin_amd64.tar.gz`](https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_darwin_amd64.tar.gz) | `62e2b5e2167c55ce...` |
| Linux (ARM64) | [`gha-local-lint_0.5.0_linux_arm64.tar.gz`](https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_linux_arm64.tar.gz) | `769e6941c5ea34fe...` |
| Linux (x86_64) | [`gha-local-lint_0.5.0_linux_amd64.tar.gz`](https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_linux_amd64.tar.gz) | `183670986b028ca4...` |

**Installed Binaries:** `gha-local-lint`  

**Verification & Update:**
```bash
brew test gha-local-lint       # Run formula self-tests
brew upgrade gha-local-lint    # Upgrade to the latest version
```

---

### `iam-shrink`

**Description:** Local-to-Least-Privilege AWS IAM Policy Generator  
**Homepage:** [https://github.com/smford/iam-shrink](https://github.com/smford/iam-shrink)  
**Version:** `0.6.0`  
**License:** `MIT`  
**Source:** [`Formula/iam-shrink.rb`](Formula/iam-shrink.rb)  

**Install:**
```bash
brew install smford/tap/iam-shrink
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`iam-shrink_0.6.0_darwin_arm64.tar.gz`](https://github.com/smford/iam-shrink/releases/download/v0.6.0/iam-shrink_0.6.0_darwin_arm64.tar.gz) | `563233c52497ec0a...` |
| macOS (Intel (x86_64)) | [`iam-shrink_0.6.0_darwin_amd64.tar.gz`](https://github.com/smford/iam-shrink/releases/download/v0.6.0/iam-shrink_0.6.0_darwin_amd64.tar.gz) | `44d9d8ccba611504...` |
| Linux (ARM64) | [`iam-shrink_0.6.0_linux_arm64.tar.gz`](https://github.com/smford/iam-shrink/releases/download/v0.6.0/iam-shrink_0.6.0_linux_arm64.tar.gz) | `2afc4e47be3dc854...` |
| Linux (x86_64) | [`iam-shrink_0.6.0_linux_amd64.tar.gz`](https://github.com/smford/iam-shrink/releases/download/v0.6.0/iam-shrink_0.6.0_linux_amd64.tar.gz) | `7ec65118f47b6277...` |

**Installed Binaries:** `iam-shrink`  

**Verification & Update:**
```bash
brew test iam-shrink       # Run formula self-tests
brew upgrade iam-shrink    # Upgrade to the latest version
```

---

### `imds-canary`

**Description:** eBPF AWS IMDS Canary & Process Attribution Daemon  
**Homepage:** [https://github.com/smford/imds-canary](https://github.com/smford/imds-canary)  
**Version:** `0.1.0`  
**License:** `MIT`  
**Source:** [`Formula/imds-canary.rb`](Formula/imds-canary.rb)  

**Install:**
```bash
brew install smford/tap/imds-canary
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`imds-canary_0.1.0_darwin_arm64.tar.gz`](https://github.com/smford/imds-canary/releases/download/v0.1.0/imds-canary_0.1.0_darwin_arm64.tar.gz) | `0683a8ac7c7079a9...` |
| macOS (Intel (x86_64)) | [`imds-canary_0.1.0_darwin_amd64.tar.gz`](https://github.com/smford/imds-canary/releases/download/v0.1.0/imds-canary_0.1.0_darwin_amd64.tar.gz) | `01575a4b25cac772...` |
| Linux (ARM64) | [`imds-canary_0.1.0_linux_arm64.tar.gz`](https://github.com/smford/imds-canary/releases/download/v0.1.0/imds-canary_0.1.0_linux_arm64.tar.gz) | `070ad800df626673...` |
| Linux (x86_64) | [`imds-canary_0.1.0_linux_amd64.tar.gz`](https://github.com/smford/imds-canary/releases/download/v0.1.0/imds-canary_0.1.0_linux_amd64.tar.gz) | `b25503815ba4dc82...` |

**Installed Binaries:** `imds-canary`  

**Verification & Update:**
```bash
brew test imds-canary       # Run formula self-tests
brew upgrade imds-canary    # Upgrade to the latest version
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

### `mcp-jail`

**Description:** Lightweight security proxy and flight recorder for Model Context Protocol (MCP) servers  
**Homepage:** [https://github.com/smford/mcp-jail](https://github.com/smford/mcp-jail)  
**Version:** `0.6.0`  
**License:** `MIT`  
**Source:** [`Formula/mcp-jail.rb`](Formula/mcp-jail.rb)  

**Install:**
```bash
brew install smford/tap/mcp-jail
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`mcp-jail_0.6.0_darwin_arm64.tar.gz`](https://github.com/smford/mcp-jail/releases/download/v0.6.0/mcp-jail_0.6.0_darwin_arm64.tar.gz) | `a4251c81c2d28eb8...` |
| macOS (Intel (x86_64)) | [`mcp-jail_0.6.0_darwin_amd64.tar.gz`](https://github.com/smford/mcp-jail/releases/download/v0.6.0/mcp-jail_0.6.0_darwin_amd64.tar.gz) | `3da3d682bacec68e...` |
| Linux (ARM64) | [`mcp-jail_0.6.0_linux_arm64.tar.gz`](https://github.com/smford/mcp-jail/releases/download/v0.6.0/mcp-jail_0.6.0_linux_arm64.tar.gz) | `4ed978a714692b52...` |
| Linux (x86_64) | [`mcp-jail_0.6.0_linux_amd64.tar.gz`](https://github.com/smford/mcp-jail/releases/download/v0.6.0/mcp-jail_0.6.0_linux_amd64.tar.gz) | `593390345134d26d...` |

**Installed Binaries:** `mcp-jail`  

**Verification & Update:**
```bash
brew test mcp-jail       # Run formula self-tests
brew upgrade mcp-jail    # Upgrade to the latest version
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

### `onvif-camera-simulator`

**Description:** Pure Go ONVIF Profile S/T/M and RTSP camera simulator with virtual PTZ and fleet scaling  
**Homepage:** [https://github.com/smford/onvif-camera-simulator](https://github.com/smford/onvif-camera-simulator)  
**Version:** `0.2.0`  
**License:** `MIT`  
**Source:** [`Formula/onvif-camera-simulator.rb`](Formula/onvif-camera-simulator.rb)  

**Install:**
```bash
brew install smford/tap/onvif-camera-simulator
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`onvif-camera-simulator_0.2.0_darwin_arm64.tar.gz`](https://github.com/smford/onvif-camera-simulator/releases/download/v0.2.0/onvif-camera-simulator_0.2.0_darwin_arm64.tar.gz) | `4eb669a9c4848ecd...` |
| macOS (Intel (x86_64)) | [`onvif-camera-simulator_0.2.0_darwin_amd64.tar.gz`](https://github.com/smford/onvif-camera-simulator/releases/download/v0.2.0/onvif-camera-simulator_0.2.0_darwin_amd64.tar.gz) | `90601ba017099c3d...` |
| Linux (ARM64) | [`onvif-camera-simulator_0.2.0_linux_arm64.tar.gz`](https://github.com/smford/onvif-camera-simulator/releases/download/v0.2.0/onvif-camera-simulator_0.2.0_linux_arm64.tar.gz) | `dc413f74181639ab...` |
| Linux (x86_64) | [`onvif-camera-simulator_0.2.0_linux_amd64.tar.gz`](https://github.com/smford/onvif-camera-simulator/releases/download/v0.2.0/onvif-camera-simulator_0.2.0_linux_amd64.tar.gz) | `751f23b92211b0f2...` |

**Installed Binaries:** `simulator`  

**Verification & Update:**
```bash
brew test onvif-camera-simulator       # Run formula self-tests
brew upgrade onvif-camera-simulator    # Upgrade to the latest version
```

---

### `onvif-inspector`

**Description:** Real-time ONVIF IP camera event diagnostic utility and terminal inspector  
**Homepage:** [https://github.com/smford/onvif-inspector](https://github.com/smford/onvif-inspector)  
**Version:** `1.0.0`  
**License:** `MIT`  
**Source:** [`Formula/onvif-inspector.rb`](Formula/onvif-inspector.rb)  

**Install:**
```bash
brew install smford/tap/onvif-inspector
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`onvif-inspector_1.0.0_darwin_arm64.tar.gz`](https://github.com/smford/onvif-inspector/releases/download/v1.0.0/onvif-inspector_1.0.0_darwin_arm64.tar.gz) | `b3c349dfece92744...` |
| macOS (Intel (x86_64)) | [`onvif-inspector_1.0.0_darwin_amd64.tar.gz`](https://github.com/smford/onvif-inspector/releases/download/v1.0.0/onvif-inspector_1.0.0_darwin_amd64.tar.gz) | `3050eaf7fbdd0bb8...` |
| Linux (ARM64) | [`onvif-inspector_1.0.0_linux_arm64.tar.gz`](https://github.com/smford/onvif-inspector/releases/download/v1.0.0/onvif-inspector_1.0.0_linux_arm64.tar.gz) | `fc3e8125f3e87b81...` |
| Linux (x86_64) | [`onvif-inspector_1.0.0_linux_amd64.tar.gz`](https://github.com/smford/onvif-inspector/releases/download/v1.0.0/onvif-inspector_1.0.0_linux_amd64.tar.gz) | `43ebe6f41b03df9c...` |

**Installed Binaries:** `onvif-inspector`  

**Verification & Update:**
```bash
brew test onvif-inspector       # Run formula self-tests
brew upgrade onvif-inspector    # Upgrade to the latest version
```

---

### `term2svg`

**Description:** Render terminal commands, ANSI streams, tmux panes, and screen models to vector SVGs  
**Homepage:** [https://github.com/smford/golang-term2svg](https://github.com/smford/golang-term2svg)  
**Version:** `0.1.0`  
**License:** `MIT`  
**Source:** [`Formula/term2svg.rb`](Formula/term2svg.rb)  

**Install:**
```bash
brew install smford/tap/term2svg
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| Universal (All) | [`term2svg_v0.1.0_darwin_arm64.tar.gz`](https://github.com/smford/golang-term2svg/releases/download/v0.1.0/term2svg_v0.1.0_darwin_arm64.tar.gz) | `94e75f288b273a44...` |

**Installed Binaries:** `term2svg`, `term2svg`, `term2svg`, `term2svg`  

**Verification & Update:**
```bash
brew test term2svg       # Run formula self-tests
brew upgrade term2svg    # Upgrade to the latest version
```

---

### `termtosvg`

**Description:** Render gorgeous, pixel-perfect SVGs from terminal commands, live screens, or ANSI logs  
**Homepage:** [https://github.com/smford/terminal-to-svg](https://github.com/smford/terminal-to-svg)  
**Version:** `0.1.1`  
**License:** `MIT`  
**Source:** [`Formula/termtosvg.rb`](Formula/termtosvg.rb)  

**Install:**
```bash
brew install smford/tap/termtosvg
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`terminal-to-svg_0.1.1_darwin_arm64.tar.gz`](https://github.com/smford/terminal-to-svg/releases/download/v0.1.1/terminal-to-svg_0.1.1_darwin_arm64.tar.gz) | `310790bd01d69d3f...` |
| macOS (Intel (x86_64)) | [`terminal-to-svg_0.1.1_darwin_amd64.tar.gz`](https://github.com/smford/terminal-to-svg/releases/download/v0.1.1/terminal-to-svg_0.1.1_darwin_amd64.tar.gz) | `17a429ccfbcd451d...` |
| Linux (ARM64) | [`terminal-to-svg_0.1.1_linux_arm64.tar.gz`](https://github.com/smford/terminal-to-svg/releases/download/v0.1.1/terminal-to-svg_0.1.1_linux_arm64.tar.gz) | `47c58f042ff6faf2...` |
| Linux (x86_64) | [`terminal-to-svg_0.1.1_linux_amd64.tar.gz`](https://github.com/smford/terminal-to-svg/releases/download/v0.1.1/terminal-to-svg_0.1.1_linux_amd64.tar.gz) | `d1cb9297d1b5f1af...` |

**Installed Binaries:** `termtosvg`  

**Verification & Update:**
```bash
brew test termtosvg       # Run formula self-tests
brew upgrade termtosvg    # Upgrade to the latest version
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

### `tf-move-gen`

**Description:** Automated refactoring generator for Terraform and OpenTofu moved blocks  
**Homepage:** [https://github.com/smford/tf-move-gen](https://github.com/smford/tf-move-gen)  
**Version:** `0.1.0`  
**License:** `MIT`  
**Source:** [`Formula/tf-move-gen.rb`](Formula/tf-move-gen.rb)  

**Install:**
```bash
brew install smford/tap/tf-move-gen
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`tf-move-gen_0.1.0_darwin_arm64.tar.gz`](https://github.com/smford/tf-move-gen/releases/download/v0.1.0/tf-move-gen_0.1.0_darwin_arm64.tar.gz) | `d164d183fe89fbbf...` |
| macOS (Intel (x86_64)) | [`tf-move-gen_0.1.0_darwin_amd64.tar.gz`](https://github.com/smford/tf-move-gen/releases/download/v0.1.0/tf-move-gen_0.1.0_darwin_amd64.tar.gz) | `d2f169dbb1ec67b7...` |
| Linux (ARM64) | [`tf-move-gen_0.1.0_linux_arm64.tar.gz`](https://github.com/smford/tf-move-gen/releases/download/v0.1.0/tf-move-gen_0.1.0_linux_arm64.tar.gz) | `b610737da1415e5c...` |
| Linux (x86_64) | [`tf-move-gen_0.1.0_linux_amd64.tar.gz`](https://github.com/smford/tf-move-gen/releases/download/v0.1.0/tf-move-gen_0.1.0_linux_amd64.tar.gz) | `b02940985009a2cf...` |

**Installed Binaries:** `tf-move-gen`  

**Verification & Update:**
```bash
brew test tf-move-gen       # Run formula self-tests
brew upgrade tf-move-gen    # Upgrade to the latest version
```

---

### `video-amplifier`

**Description:** High-performance streaming proxy for IP cameras with zero-transcode fan-out  
**Homepage:** [https://github.com/smford/video-amplifier](https://github.com/smford/video-amplifier)  
**Version:** `1.0.0`  
**License:** `MIT`  
**Source:** [`Formula/video-amplifier.rb`](Formula/video-amplifier.rb)  

**Install:**
```bash
brew install smford/tap/video-amplifier
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`video-amplifier_1.0.0_darwin_arm64.tar.gz`](https://github.com/smford/video-amplifier/releases/download/v1.0.0/video-amplifier_1.0.0_darwin_arm64.tar.gz) | `7f1b9119ebe22351...` |
| macOS (Intel (x86_64)) | [`video-amplifier_1.0.0_darwin_amd64.tar.gz`](https://github.com/smford/video-amplifier/releases/download/v1.0.0/video-amplifier_1.0.0_darwin_amd64.tar.gz) | `108dc01571c7a7b3...` |
| Linux (ARM64) | [`video-amplifier_1.0.0_linux_arm64.tar.gz`](https://github.com/smford/video-amplifier/releases/download/v1.0.0/video-amplifier_1.0.0_linux_arm64.tar.gz) | `0191d47804118aab...` |
| Linux (x86_64) | [`video-amplifier_1.0.0_linux_amd64.tar.gz`](https://github.com/smford/video-amplifier/releases/download/v1.0.0/video-amplifier_1.0.0_linux_amd64.tar.gz) | `ceb8261504549039...` |

**Installed Binaries:** `video-amplifier`  

**Verification & Update:**
```bash
brew test video-amplifier       # Run formula self-tests
brew upgrade video-amplifier    # Upgrade to the latest version
```

---

### `webhook-replay-proxy`

**Description:** Production-grade webhook capture, replay, and inspection proxy  
**Homepage:** [https://github.com/smford/webhook-replay-proxy](https://github.com/smford/webhook-replay-proxy)  
**Version:** `0.2.1`  
**License:** `MIT`  
**Source:** [`Formula/webhook-replay-proxy.rb`](Formula/webhook-replay-proxy.rb)  

**Install:**
```bash
brew install smford/tap/webhook-replay-proxy
```

**Supported Platforms & Packages:**

| OS / Architecture | Binary Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS (Apple Silicon (ARM64)) | [`webhook-replay-proxy_0.2.1_darwin_arm64.tar.gz`](https://github.com/smford/webhook-replay-proxy/releases/download/v0.2.1/webhook-replay-proxy_0.2.1_darwin_arm64.tar.gz) | `6e7e45c8d2f58a48...` |
| macOS (Intel (x86_64)) | [`webhook-replay-proxy_0.2.1_darwin_amd64.tar.gz`](https://github.com/smford/webhook-replay-proxy/releases/download/v0.2.1/webhook-replay-proxy_0.2.1_darwin_amd64.tar.gz) | `71a0a97b2d1e9350...` |
| Linux (ARM64) | [`webhook-replay-proxy_0.2.1_linux_arm64.tar.gz`](https://github.com/smford/webhook-replay-proxy/releases/download/v0.2.1/webhook-replay-proxy_0.2.1_linux_arm64.tar.gz) | `0ca3f3e01360b078...` |
| Linux (x86_64) | [`webhook-replay-proxy_0.2.1_linux_amd64.tar.gz`](https://github.com/smford/webhook-replay-proxy/releases/download/v0.2.1/webhook-replay-proxy_0.2.1_linux_amd64.tar.gz) | `2eff0034f68a6039...` |

**Installed Binaries:** `webhook-replay-proxy`  

**Verification & Update:**
```bash
brew test webhook-replay-proxy       # Run formula self-tests
brew upgrade webhook-replay-proxy    # Upgrade to the latest version
```

---

## 🔍 Cask Details

### `osx-traffic-stats`

**Application Name:** OSX Traffic Stats  
**Description:** Real-time macOS menu bar network traffic monitor  
**Homepage:** [https://github.com/smford/osx-traffic-stats](https://github.com/smford/osx-traffic-stats)  
**Version:** `1.3.0`  
**Source:** [`Casks/osx-traffic-stats.rb`](Casks/osx-traffic-stats.rb)  

**Install:**
```bash
brew install --cask smford/tap/osx-traffic-stats
```

**Installed Application:** `OSXTrafficStats.app`  

**Download Artifacts & Checksums:**

| Platform | Download Package | SHA-256 Checksum |
| :--- | :--- | :--- |
| macOS | [`OSXTrafficStats-v1.3.0-macOS.zip`](https://github.com/smford/osx-traffic-stats/releases/download/v1.3.0/OSXTrafficStats-v1.3.0-macOS.zip) | `86708bc9d814a227...` |

**Configuration & Data Cleanup (Zap):** `~/Library/Application Support/com.smford.osx-traffic-stats`, `~/Library/LaunchAgents/com.smford.osx-traffic-stats.plist`  

**Verification & Update:**
```bash
brew upgrade --cask osx-traffic-stats    # Upgrade to the latest version
brew uninstall --cask osx-traffic-stats  # Uninstall the application
```

---

## 🛠 Maintenance & Tap Commands

```bash
# Update Homebrew formula and cask definitions
brew update

# Upgrade all installed packages from this tap
brew upgrade
brew upgrade --cask

# Remove a formula or cask
brew uninstall <formula>
brew uninstall --cask <cask>

# Untap this repository
brew untap smford/tap
```

## 🤖 Automated CI/CD

This repository uses **GitHub Actions** to automatically update documentation whenever definitions in `Formula/*.rb` or `Casks/*.rb` are modified:
- Updates and formats `README.md`
- Builds and deploys the static GitHub Page to [https://smford.github.io/homebrew-tap/](https://smford.github.io/homebrew-tap/)

---
<sub>Documentation automatically generated on `2026-10-29 21:39:02 UTC`.</sub>
