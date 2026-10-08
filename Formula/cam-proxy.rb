# typed: false
# frozen_string_literal: true

# This formula was auto-generated for cam-proxy (https://github.com/smford/cam-proxy).
class CamProxy < Formula
  desc "Lightweight edge camera gateway — snapshots, PTZ control, and ONVIF-to-MQTT events"
  homepage "https://github.com/smford/cam-proxy"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_darwin_arm64.tar.gz"
      sha256 "c110871f65791f7f0d1e81cfc2ecadc81c7d355f790a98ce567afbfd09c9cb61"
    end
    on_intel do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_darwin_amd64.tar.gz"
      sha256 "9ab7fb2ebe0c8d8c7381e323df8628a3312241637dcc5059f0253ba029187797"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_linux_arm64.tar.gz"
      sha256 "ebdf9e8120d46b1eb851272687cd84795bde9d4222018c7052f1591760b536bc"
    end
    on_intel do
      url "https://github.com/smford/cam-proxy/releases/download/v#{version}/cam-proxy_#{version}_linux_amd64.tar.gz"
      sha256 "911d5116c7eec2f86c7cb9c2f9d23f7557fb80a89f8892d6a308c70532abab24"
    end
  end

  def install
    bin.install "cam-proxy"
  end

  test do
    assert_match "cam-proxy version", shell_output("#{bin}/cam-proxy --version")
  end
end
