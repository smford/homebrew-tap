# typed: false
# frozen_string_literal: true

# This formula was auto-generated for onvif-inspector (https://github.com/smford/onvif-inspector).
class OnvifInspector < Formula
  desc "Real-time ONVIF IP camera event diagnostic utility and terminal inspector"
  homepage "https://github.com/smford/onvif-inspector"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/onvif-inspector/releases/download/v#{version}/onvif-inspector_#{version}_darwin_arm64.tar.gz"
      sha256 "b3c349dfece92744e57e14a734bac575811102e5b92663322364b9793a7f2f68"
    end
    on_intel do
      url "https://github.com/smford/onvif-inspector/releases/download/v#{version}/onvif-inspector_#{version}_darwin_amd64.tar.gz"
      sha256 "3050eaf7fbdd0bb8a83f2dda3864da653b98315b6caa245df1c2bc3b8a35960c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/onvif-inspector/releases/download/v#{version}/onvif-inspector_#{version}_linux_arm64.tar.gz"
      sha256 "fc3e8125f3e87b8149f6d21becef806e9cafc5ada1e8fad5e920ae1da1cda666"
    end
    on_intel do
      url "https://github.com/smford/onvif-inspector/releases/download/v#{version}/onvif-inspector_#{version}_linux_amd64.tar.gz"
      sha256 "43ebe6f41b03df9c1f857c227a5295373e2bff7498af0d767c9f3513ac649045"
    end
  end

  def install
    bin.install "onvif-inspector"
  end

  test do
    assert_match "onvif-inspector version", shell_output("#{bin}/onvif-inspector -v")
  end
end
