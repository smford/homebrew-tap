# typed: false
# frozen_string_literal: true

# This formula was auto-generated for cert-chain-doctor (https://github.com/smford/cert-chain-doctor).
class CertChainDoctor < Formula
  desc "Visual TLS handshake & intermediate certificate chain debugger and AIA auto-repairer"
  homepage "https://github.com/smford/cert-chain-doctor"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_darwin_arm64.tar.gz"
      sha256 "b62843f116ccd82c2f2155c1bd2bcadccacb3ead7c2ba0d1a13e9b0b3a0cc53f"
    end
    on_intel do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_darwin_amd64.tar.gz"
      sha256 "e18cfaa336cbf772f80fc278a193eec127ce5cb716dfb34f6df84fb035da2adb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_linux_arm64.tar.gz"
      sha256 "50c57b9a0aba67e01cdac4388fe78c80b2ca5779e6481299787aa06d3127f751"
    end
    on_intel do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_linux_amd64.tar.gz"
      sha256 "5204217b577f2eee077d5348df5afe27c14913872093f0e587ef522f72f25d54"
    end
  end

  def install
    bin.install "cert-chain-doctor"
  end

  test do
    system "#{bin}/cert-chain-doctor", "--version"
  end
end
