# typed: false
# frozen_string_literal: true

# This formula was auto-generated for cert-chain-doctor (https://github.com/smford/cert-chain-doctor).
class CertChainDoctor < Formula
  desc "Visual TLS handshake & intermediate certificate chain debugger and AIA auto-repairer"
  homepage "https://github.com/smford/cert-chain-doctor"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_darwin_arm64.tar.gz"
      sha256 "10ad5d9e73e544e5f9f44c080278ef9e5d16a77f213a0084a39d43a4764ed173"
    end
    on_intel do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_darwin_amd64.tar.gz"
      sha256 "a83838e285598d9bd86b8546996b4c648a84c7a6b595c7c3da8a9806ebd16e34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_linux_arm64.tar.gz"
      sha256 "620af6da36165b3126d5a2ae5a607aeea6ff3e00b2f76d34417c4d1d75e9e785"
    end
    on_intel do
      url "https://github.com/smford/cert-chain-doctor/releases/download/v#{version}/cert-chain-doctor_#{version}_linux_amd64.tar.gz"
      sha256 "afb010b3d6fc6c431429ed5b666ed6705ff18848e097161e508b9a50d889f338"
    end
  end

  def install
    bin.install "cert-chain-doctor"
  end

  test do
    system "#{bin}/cert-chain-doctor", "--version"
  end
end
