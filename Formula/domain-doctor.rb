# typed: false
# frozen_string_literal: true

# This formula was auto-generated for domain-doctor (https://github.com/smford/domain-doctor).
class DomainDoctor < Formula
  desc "Comprehensive domain health, DNS diagnostic, and TLS autopsy CLI tool"
  homepage "https://github.com/smford/domain-doctor"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_darwin_arm64.tar.gz"
      sha256 "04c2b6cf77aeccbd1696e4724661c0029bb2a9097f7316d53e827fd1e632e739"
    end
    on_intel do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_darwin_amd64.tar.gz"
      sha256 "97a4c92d3fe3c9afbb1084fe6bbec5f929c8515269f2110ae74f2febeb7e77ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_linux_arm64.tar.gz"
      sha256 "705d1fa61e74280ba4277d1ef8bd9cee23c978ca85c226db81c37c7767745039"
    end
    on_intel do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_linux_amd64.tar.gz"
      sha256 "407a7d4fa840c601c4efe61a82c51a6ab2b310d5c677f6710bd73c3d7315c28b"
    end
  end

  def install
    bin.install "domain-doctor"
  end

  test do
    assert_match "domain-doctor", shell_output("#{bin}/domain-doctor --version")
  end
end
