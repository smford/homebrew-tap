# typed: false
# frozen_string_literal: true

# This formula was auto-generated for chrome-tab-cleaner (https://github.com/smford/chrome-tab-cleaner).
class ChromeTabCleaner < Formula
  desc "Terminal UI for macOS to inspect Chrome tabs by Memory/CPU and bring them to focus"
  homepage "https://github.com/smford/chrome-tab-cleaner"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_darwin_arm64.tar.gz"
      sha256 "d7ee53f773206b3ecd733585d631fcfc65f29c1d2cd882cf106cb898e6a785bb"
    end
    on_intel do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_darwin_amd64.tar.gz"
      sha256 "288a66db2cc6c28d2767599f3a0e5dbb65e81195337571640b680fc06935fd78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_linux_arm64.tar.gz"
      sha256 "9ab03d714c027c22df0e595d4e8307a9415f05023848b689d3b75212e5af2609"
    end
    on_intel do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_linux_amd64.tar.gz"
      sha256 "dd413d19fef3b6ec7b711b0cc3f8b49ac6e221038d65c00219a9272d6edd7553"
    end
  end

  def install
    bin.install "chrome-tab-cleaner"
  end

  test do
    system "#{bin}/chrome-tab-cleaner", "-version"
  end
end
