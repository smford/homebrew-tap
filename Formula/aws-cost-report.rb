# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.14.0/aws-cost-report_0.14.0_darwin_arm64.tar.gz"
      sha256 "b358742e3f1de36c3f6e09e35bbfe5a9509cb86e9fa850642c6330e7d96ec53e"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.14.0/aws-cost-report_0.14.0_darwin_amd64.tar.gz"
      sha256 "7da5a15923200dc7bd69a6abb38544fffa1333d10b25b98f815249588489d5a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.14.0/aws-cost-report_0.14.0_linux_arm64.tar.gz"
      sha256 "4f7c41c4fccf991d19e089908785c658e1d5ffe2ca27c80578e408bc3bd28073"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.14.0/aws-cost-report_0.14.0_linux_amd64.tar.gz"
      sha256 "49e07d792601ac3a573443aa8c3d93de5e8690111a67ee2cca2ee8c69a0b3c84"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
