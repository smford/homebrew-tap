# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.2/aws-cost-report_0.15.2_darwin_arm64.tar.gz"
      sha256 "2a2248579d9d4cc11864a5c827de1c9682446924ffb8cd24394993fc0e6a0e84"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.2/aws-cost-report_0.15.2_darwin_amd64.tar.gz"
      sha256 "25acaafa25a3b31409ffd8a5b1cff82ec94c234ca1280eb6e0a5d0db3c1de657"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.2/aws-cost-report_0.15.2_linux_arm64.tar.gz"
      sha256 "3b787b6577bae364baf19ebbb0014c86ed6d44e2507750d78391217e97ffeed5"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.2/aws-cost-report_0.15.2_linux_amd64.tar.gz"
      sha256 "e540f64f72c4442ba6ce5b0ed5ccb1a47cc4071a04a4d60056ae39f3c34510f9"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
