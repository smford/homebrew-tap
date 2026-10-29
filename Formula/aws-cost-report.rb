# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.8.0/aws-cost-report_0.8.0_darwin_arm64.tar.gz"
      sha256 "5d503edc47c7e99937a0d806b3366985286ac22fbfdf592077e8daac2357513e"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.8.0/aws-cost-report_0.8.0_darwin_amd64.tar.gz"
      sha256 "1f4dbd429c285f380d113658bb36ca6b864103da8025b9df91bda93d8356ff70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.8.0/aws-cost-report_0.8.0_linux_arm64.tar.gz"
      sha256 "1e76456f18f63dc4c18f9e9807c86897347894dea8698d9f5ce4fe2a33abe95a"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.8.0/aws-cost-report_0.8.0_linux_amd64.tar.gz"
      sha256 "351fd13448f6189606381ddb20a5b7905a32e4b9b01697177481a70d11a269ec"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
