# smford/tap

[![Documentation & Pages](https://github.com/smford/homebrew-tap/actions/workflows/docs-and-pages.yml/badge.svg)](https://github.com/smford/homebrew-tap/actions/workflows/docs-and-pages.yml)
[![GitHub Pages](https://img.shields.io/badge/docs-GitHub%20Pages-2563eb.svg)](https://smford.github.io/homebrew-tap/)
![Formulas Count](https://img.shields.io/badge/formulas-4-10b981.svg)

Official [Homebrew](https://brew.sh/) tap for [smford](https://github.com/smford/homebrew-tap).
Browse the interactive documentation and web catalog at **[https://smford.github.io/homebrew-tap/](https://smford.github.io/homebrew-tap/)**.

## 📦 Installation & Usage

### Method 1: Tap repository (Recommended)

Add this tap once to Homebrew, then install any package directly by its formula name:

```bash
# Add this tap to your Homebrew installation
brew tap smford/tap

# Install a formula (e.g. delim)
brew install delim
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
| [`delim`](#delim) | Creates a visual line to aid in reading terminal screens | `0.2.0` | `MIT` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/delim` |
| [`matrix-rain`](#matrix-rain) | Authentic Matrix digital rain terminal simulator written in Go | `1.1.0` | `MIT` | macOS, Linux | `brew install smford/tap/matrix-rain` |
| [`mcat`](#mcat) | Authentic Matrix digital rain terminal simulator and text viewer written in Go | `1.2.0` | `MIT` | macOS, Linux | `brew install smford/tap/mcat` |
| [`mdee`](#mdee) | Terminal Markdown viewer for macOS iTerm2 | `1.8.2` | `AGPL-3.0-or-later` | macOS (Apple Silicon & Intel), Linux (ARM64 & x86_64) | `brew install smford/tap/mdee` |

---

## 🔍 Formula Details

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
<sub>Documentation automatically generated on `2026-09-19 22:50:17 UTC`.</sub>
