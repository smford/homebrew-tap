# typed: false
# frozen_string_literal: true

# This formula was auto-generated for domain-doctor (https://github.com/smford/domain-doctor).
class DomainDoctor < Formula
  desc "Comprehensive domain health, DNS diagnostic, and TLS autopsy CLI tool"
  homepage "https://github.com/smford/domain-doctor"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_darwin_arm64.tar.gz"
      sha256 "bd070967a05fddae698c8cb7f25fbe240dd2d85b12eba2533a38b9e3f9e4d019"
    end
    on_intel do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_darwin_amd64.tar.gz"
      sha256 "c1afef1922769144babc6829bef103ab520feb186156dfa96bbe7a9bb4d6aa40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_linux_arm64.tar.gz"
      sha256 "925c9b5fa9fdf9cdccb5d3519a2504b6b245c5719ae1eef638e7e4002f86c44a"
    end
    on_intel do
      url "https://github.com/smford/domain-doctor/releases/download/v#{version}/domain-doctor_#{version}_linux_amd64.tar.gz"
      sha256 "6663f9f7a88f3c81f1fbb70cce8fb640a840a1c72f03e5892f29ad586c314a44"
    end
  end

  def install
    bin.install "domain-doctor"
  end

  test do
    assert_match "domain-doctor", shell_output("#{bin}/domain-doctor --version")
  end
end
