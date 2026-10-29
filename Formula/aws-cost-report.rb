# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.6.0/aws-cost-report_0.6.0_darwin_arm64.tar.gz"
      sha256 "c67b9cd73afc95980ca8b7df212c3832c9ffae19a639aaeb92024cacc6e9bbcb"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.6.0/aws-cost-report_0.6.0_darwin_amd64.tar.gz"
      sha256 "acd4338653f579bea850c6a3bea669f19ecaf24be23ac9e05ab3a19145e10710"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.6.0/aws-cost-report_0.6.0_linux_arm64.tar.gz"
      sha256 "860c72088a7bb26d2f11c1445767801639746d78d6fa15d69df258b88891259d"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.6.0/aws-cost-report_0.6.0_linux_amd64.tar.gz"
      sha256 "072bacd7eeedbfed9791102e4fd0ef58a4f848344c6bd40b583b647dd987541c"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
