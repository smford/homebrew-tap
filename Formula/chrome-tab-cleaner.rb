# typed: false
# frozen_string_literal: true

# This formula was auto-generated for chrome-tab-cleaner (https://github.com/smford/chrome-tab-cleaner).
class ChromeTabCleaner < Formula
  desc "Terminal UI for macOS to inspect Chrome tabs by Memory/CPU and bring them to focus"
  homepage "https://github.com/smford/chrome-tab-cleaner"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_darwin_arm64.tar.gz"
      sha256 "116458595595bf8931eabcfffc0e3723fa47fd2a8009ffccd8d301fc5346fa34"
    end
    on_intel do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_darwin_amd64.tar.gz"
      sha256 "94b070f8d284e7d8cf61b510007dcae38f86346df294eed5fa724bdb5488daea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_linux_arm64.tar.gz"
      sha256 "fe53bbbb882342061bae7813e2d9b399fa1494afcb612d3c655f6e0ac586fb9c"
    end
    on_intel do
      url "https://github.com/smford/chrome-tab-cleaner/releases/download/v#{version}/chrome-tab-cleaner_#{version}_linux_amd64.tar.gz"
      sha256 "3a518177067b6f49b16924552d09f1900abed5674f21068e3eb308fa4faf0b88"
    end
  end

  def install
    bin.install "chrome-tab-cleaner"
  end

  test do
    system "#{bin}/chrome-tab-cleaner", "-version"
  end
end
