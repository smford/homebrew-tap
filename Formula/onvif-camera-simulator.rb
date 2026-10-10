# typed: false
# frozen_string_literal: true

# This formula was auto-generated for onvif-camera-simulator (https://github.com/smford/onvif-camera-simulator).
class OnvifCameraSimulator < Formula
  desc "Pure Go ONVIF Profile S/T/M and RTSP camera simulator with virtual PTZ and fleet scaling"
  homepage "https://github.com/smford/onvif-camera-simulator"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_darwin_arm64.tar.gz"
      sha256 "6fad2d8de8d13222060caebbe8bb32016490da20995124d9384381eb24760972"
    end
    on_intel do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_darwin_amd64.tar.gz"
      sha256 "471bb49befff714d7fd3659ad5e1f95b17a7bf2fde0588872441150468581353"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_linux_arm64.tar.gz"
      sha256 "52cdd232e4c83e21155ae68876d103455c58aea0c9e8614ddf1e7318cec85c26"
    end
    on_intel do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_linux_amd64.tar.gz"
      sha256 "e04d72f4958c8e456a6b544310810223b4a0253b760cadfe7eac468b19ac1c87"
    end
  end

  def install
    bin.install "simulator" => "onvif-camera-simulator"
  end

  test do
    assert_match "onvif-camera-simulator version", shell_output("#{bin}/onvif-camera-simulator -version")
  end
end
