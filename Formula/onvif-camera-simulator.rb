# typed: false
# frozen_string_literal: true

# This formula was auto-generated for onvif-camera-simulator (https://github.com/smford/onvif-camera-simulator).
class OnvifCameraSimulator < Formula
  desc "Pure Go ONVIF Profile S/T/M and RTSP camera simulator with virtual PTZ and fleet scaling"
  homepage "https://github.com/smford/onvif-camera-simulator"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_darwin_arm64.tar.gz"
      sha256 "4eb669a9c4848ecdd1378d3affc43ba63e9b88c22b517bdf3bddc7f1ca0e82ad"
    end
    on_intel do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_darwin_amd64.tar.gz"
      sha256 "90601ba017099c3d41b58eba3c37158866f64409c7a9c53e2a4a88c64b58cbcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_linux_arm64.tar.gz"
      sha256 "dc413f74181639ab3e4ca598e5adf3ea48a1f58b36f58462845e3b2f2046c979"
    end
    on_intel do
      url "https://github.com/smford/onvif-camera-simulator/releases/download/v#{version}/onvif-camera-simulator_#{version}_linux_amd64.tar.gz"
      sha256 "751f23b92211b0f2ce7914be24a3837b80d7602f06af6c097aedc5a3801a475a"
    end
  end

  def install
    bin.install "simulator" => "onvif-camera-simulator"
  end

  test do
    assert_match "onvif-camera-simulator version", shell_output("#{bin}/onvif-camera-simulator -version")
  end
end
