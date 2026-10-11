# typed: false
# frozen_string_literal: true

# This formula was auto-generated for terminal-to-svg (https://github.com/smford/terminal-to-svg).
class Termtosvg < Formula
  desc "Render gorgeous, pixel-perfect SVGs from terminal commands, live screens, or ANSI logs"
  homepage "https://github.com/smford/terminal-to-svg"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/terminal-to-svg/releases/download/v#{version}/terminal-to-svg_#{version}_darwin_arm64.tar.gz"
      sha256 "310790bd01d69d3fb6363caa05546dd34235c93c9e72931b2ef8e723034b5ab3"
    end
    on_intel do
      url "https://github.com/smford/terminal-to-svg/releases/download/v#{version}/terminal-to-svg_#{version}_darwin_amd64.tar.gz"
      sha256 "17a429ccfbcd451d8e6d607d619340d6679a0c0534caeb21a92cca8cdd3b1cda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/terminal-to-svg/releases/download/v#{version}/terminal-to-svg_#{version}_linux_arm64.tar.gz"
      sha256 "47c58f042ff6faf2eeeb51fe9a841941b4b65a8e1c9badb844fd872d66d4cdcc"
    end
    on_intel do
      url "https://github.com/smford/terminal-to-svg/releases/download/v#{version}/terminal-to-svg_#{version}_linux_amd64.tar.gz"
      sha256 "d1cb9297d1b5f1afc2cb92ea72bd3bb7a4e413d930bb6f22d4eacd8a12e728e7"
    end
  end

  def install
    bin.install "termtosvg"
  end

  test do
    system "#{bin}/termtosvg", "-version"
  end
end
