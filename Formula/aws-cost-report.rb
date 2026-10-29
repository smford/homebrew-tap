# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.10.0/aws-cost-report_0.10.0_darwin_arm64.tar.gz"
      sha256 "658eea21f7458835478df4fc90055dcbe1a381a91fd4e2cf4361eb189c148b54"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.10.0/aws-cost-report_0.10.0_darwin_amd64.tar.gz"
      sha256 "2a39900a6f4515e1b2a986b3348ba2f099c8c8bdda11edaf00c4dac8e9c70566"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.10.0/aws-cost-report_0.10.0_linux_arm64.tar.gz"
      sha256 "cfd0ca8ebd9d013cdbf1f5b73ca5df58d7f51931af5d7be09e8eadd00f0fa122"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.10.0/aws-cost-report_0.10.0_linux_amd64.tar.gz"
      sha256 "3e71f767802581b7d748b7e4ff7bdd7a6615ca1b4c7d7e88687d58ee6e23d86e"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
