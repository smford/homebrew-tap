# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.5.0/aws-cost-report_0.5.0_darwin_arm64.tar.gz"
      sha256 "2cd2067a93b1152050c9e8a98c8d18ff7b3210f9fc4614a9e60c9e2054a92064"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.5.0/aws-cost-report_0.5.0_darwin_amd64.tar.gz"
      sha256 "cfb345614f24f8841ea2117b78f72e42307cab9b12e22a41b9c126cb4d8d26bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.5.0/aws-cost-report_0.5.0_linux_arm64.tar.gz"
      sha256 "0a388eedbc9db6d0b100ec0d49bfddd1a873942d9c71d6a36a9deb0e94f7092f"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.5.0/aws-cost-report_0.5.0_linux_amd64.tar.gz"
      sha256 "522b185b12064411a700ac87dec1f2398f4603a5890cf7e99a464b28a2e6b811"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
