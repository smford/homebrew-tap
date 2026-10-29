# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.11.0/aws-cost-report_0.11.0_darwin_arm64.tar.gz"
      sha256 "0d61ee31db159e99fba658f93544ba6ba42c1909a6cb16876990891be76d8118"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.11.0/aws-cost-report_0.11.0_darwin_amd64.tar.gz"
      sha256 "3091af7f3f205d4b69d5d1dd49493b2d980185738d18ff3b5162a448b565eaca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.11.0/aws-cost-report_0.11.0_linux_arm64.tar.gz"
      sha256 "657ac1c35e0cfc4dd30be0a71123e3da652ca827922135303dff598425c4a3e8"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.11.0/aws-cost-report_0.11.0_linux_amd64.tar.gz"
      sha256 "1e44278c8ed5dd02d5d6114a42c336e3b797c79bb5dc799ffc1f324a7004798a"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
