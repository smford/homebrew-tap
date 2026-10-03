# typed: false
# frozen_string_literal: true

# This formula was auto-generated for cam-proxy (https://github.com/smford/cam-proxy).
class CamProxy < Formula
  desc "Lightweight edge camera gateway — snapshots, PTZ control, and ONVIF-to-MQTT events"
  homepage "https://github.com/smford/cam-proxy"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_darwin_arm64.tar.gz"
      sha256 "bc9264298a81f55d5cac3e7abfbf2c61b2731d711c2ea74ec641ce6efa147a54"
    end
    on_intel do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_darwin_amd64.tar.gz"
      sha256 "101868c1c42f9e10c28c6c7215fa7b1e88af445043b87fc7e9e2ce5fafc61921"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_linux_arm64.tar.gz"
      sha256 "fc24be78bcfc806f73e77f76539e4d988840f1abaac60d9db9afaf95c23c9248"
    end
    on_intel do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_linux_amd64.tar.gz"
      sha256 "71f77f4a98d4a6553ba4aa873a851d3c75aaa83eaa17eae9790498a15d806ee5"
    end
  end

  def install
    bin.install "cam-proxy"
  end

  test do
    assert_match "cam-proxy version", shell_output("#{bin}/cam-proxy --version")
  end
end
