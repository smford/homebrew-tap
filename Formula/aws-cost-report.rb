# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.1/aws-cost-report_0.3.1_darwin_arm64.tar.gz"
      sha256 "be51f89838fc607ea1679b1c623e32d757a47c354678ea796b0141f137add36c"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.1/aws-cost-report_0.3.1_darwin_amd64.tar.gz"
      sha256 "eeef083cd55ae8cef1e35c329c62f018b0ecf531b1bb77160260f37efdacbe27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.1/aws-cost-report_0.3.1_linux_arm64.tar.gz"
      sha256 "43412aca0c955e6dffb91d10c25f83fca8f221619d7850b86d0ae1932075d5e7"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.3.1/aws-cost-report_0.3.1_linux_amd64.tar.gz"
      sha256 "ec45ea37210e0c5e77bcdf37155e1b9bbca2e2cb8746615f7fc2f972a6ed01dc"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
