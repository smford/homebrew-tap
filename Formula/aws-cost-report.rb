# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.2.0/aws-cost-report_0.2.0_darwin_arm64.tar.gz"
      sha256 "d6bdb93a0f839ea402255eda2d8afbb057d9ed5ba10d3b8bd596f12b05eef121"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.2.0/aws-cost-report_0.2.0_darwin_amd64.tar.gz"
      sha256 "762a03e7df55f139c4b695ff5712c8e52a4394db37f742bd49b3eaa7bd9cb099"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.2.0/aws-cost-report_0.2.0_linux_arm64.tar.gz"
      sha256 "90e1d36ee49d6beb4a95fca466d4320a5e1c1b4f03b05b0305743bbb00cca216"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.2.0/aws-cost-report_0.2.0_linux_amd64.tar.gz"
      sha256 "b9763eda0dff3ab517763892def37c017eb636aa6f9caccb83a70b651f5659d5"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
