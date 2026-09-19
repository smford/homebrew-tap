# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mdee (https://github.com/smford/mdee).
class Mdee < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/mdee"
  version "1.8.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-arm64.tar.gz"
      sha256 "6741dc878b8c02cab8a4361e8598c2e50c3a915db3ff401d02b6c62ba3aca85b"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-amd64.tar.gz"
      sha256 "d61fd060b1381dca59a5e536149b25044665e6038e03923a06b3cc2482ef3bd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-arm64.tar.gz"
      sha256 "f638cada7bb337930679286a7cbe4d2f478b647107381ff46ea7c7e27b1bff3e"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-amd64.tar.gz"
      sha256 "e133f87ed6e9c5bd2ee1d2a52826e65bd37163f09adc3c22d07553d2c3fa57ed"
    end
  end

  def install
    bin.install "mdee"
  end

  test do
    assert_match "mdee version", shell_output("#{bin}/mdee --version")
  end
end
