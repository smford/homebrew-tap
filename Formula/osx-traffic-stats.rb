# typed: false
# frozen_string_literal: true

# This formula was auto-generated for osx-traffic-stats (https://github.com/smford/osx-traffic-stats).
class OsxTrafficStats < Formula
  desc "Real-time macOS menu bar network traffic monitor"
  homepage "https://github.com/smford/osx-traffic-stats"
  version "1.2.3"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/osx-traffic-stats-v#{version}-darwin-universal.tar.gz"
      sha256 "51aad95e00b8e6ba99bc97110ea2c0c248d7f32e3d1cf327d93c3ea42eec7d1f"
    end
    on_intel do
      url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/osx-traffic-stats-v#{version}-darwin-universal.tar.gz"
      sha256 "51aad95e00b8e6ba99bc97110ea2c0c248d7f32e3d1cf327d93c3ea42eec7d1f"
    end
  end

  def install
    bin.install "osx-traffic-stats"
  end

  test do
    assert_match "OSX Traffic Stats", shell_output("#{bin}/osx-traffic-stats -v")
  end
end
