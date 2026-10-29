# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.7.0/aws-cost-report_0.7.0_darwin_arm64.tar.gz"
      sha256 "77cfc242471bec8b88e502f563be139ecd333bf2632dacee19f934b2878d593d"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.7.0/aws-cost-report_0.7.0_darwin_amd64.tar.gz"
      sha256 "f616b2c53552964add5bfc6504b3e893c07c2c333309d797418c79d157e44934"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.7.0/aws-cost-report_0.7.0_linux_arm64.tar.gz"
      sha256 "6d4fd7b3e687f3f177f7a9123578ac0c200febdb8bfbc956bb1df5f5dc3c9fde"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.7.0/aws-cost-report_0.7.0_linux_amd64.tar.gz"
      sha256 "fc4bed85f8e5f1708403e4f401b2818c33543389e611bc5f2facf6e6d80e4ee0"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
