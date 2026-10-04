# typed: false
# frozen_string_literal: true

# This formula was auto-generated for osx-traffic-stats (https://github.com/smford/osx-traffic-stats).
class OsxTrafficStats < Formula
  desc "Real-time macOS menu bar network traffic monitor"
  homepage "https://github.com/smford/osx-traffic-stats"
  version "1.0.1"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/osx-traffic-stats-v#{version}-darwin-universal.tar.gz"
      sha256 "ca28159f81d2a76edabf5c0221231a55e30c8e330886e7671031444e56a8a984"
    end
    on_intel do
      url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/osx-traffic-stats-v#{version}-darwin-universal.tar.gz"
      sha256 "ca28159f81d2a76edabf5c0221231a55e30c8e330886e7671031444e56a8a984"
    end
  end

  def install
    bin.install "osx-traffic-stats"
  end

  test do
    assert_match "OSX Traffic Stats", shell_output("#{bin}/osx-traffic-stats -v")
  end
end
