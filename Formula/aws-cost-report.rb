# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.1/aws-cost-report_0.15.1_darwin_arm64.tar.gz"
      sha256 "b35af234ff3fb9207d48455a8d5d8b60e1433095763744cddfebb80140830078"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.1/aws-cost-report_0.15.1_darwin_amd64.tar.gz"
      sha256 "bb3d4ba15f8496a4c283a3ff1472260b3a199d66ca090df25f86a8198aa00e3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.1/aws-cost-report_0.15.1_linux_arm64.tar.gz"
      sha256 "207afa7907e5bc6c207fa3e0eefdbc0573eaeb4a9836cc78fdd89d6dfe88095b"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.1/aws-cost-report_0.15.1_linux_amd64.tar.gz"
      sha256 "f75637f4bd95e1c880d9c59a8edd6f0530e3f11c2ea7ebbe860bb31f32370c11"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
