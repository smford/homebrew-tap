# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.0/aws-cost-report_0.3.0_darwin_arm64.tar.gz"
      sha256 "30f8575acb75dbe688a411f5f4a167af59a7b9694595953f19520f9fa8f95911"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.0/aws-cost-report_0.3.0_darwin_amd64.tar.gz"
      sha256 "49924940654a722166faa74642c9feaca1dae793221531a87cab025a07a7e097"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.0/aws-cost-report_0.3.0_linux_arm64.tar.gz"
      sha256 "1c9f7928e98628584e2ee7d7acadfa19e8e428402eb3310d0883d4fe4abddd22"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.0/aws-cost-report_0.3.0_linux_amd64.tar.gz"
      sha256 "5bdfaf18e00c463bfeb143616117620358c8c29cfc1500f1565fb966bf2c04c3"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
