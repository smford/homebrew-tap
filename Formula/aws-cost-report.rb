# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.1.0/aws-cost-report_0.1.0_darwin_arm64.tar.gz"
      sha256 "d24dfad27e801ceae9be2b076665af0db21e8dd7349fafacedf6285b9cafb4db"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.1.0/aws-cost-report_0.1.0_darwin_amd64.tar.gz"
      sha256 "1ef1928408a0b7809a866db78fd6fedebaf3df771bee132a9920eb62eddd3295"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.1.0/aws-cost-report_0.1.0_linux_arm64.tar.gz"
      sha256 "ee8202a61343f5be36934818b55a586385fc71375827affc847f6afe6ca9dca7"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.1.0/aws-cost-report_0.1.0_linux_amd64.tar.gz"
      sha256 "51b7ebb66789c7ff2255af49e4230b87f876a93322308b6baaf97072997c890a"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
