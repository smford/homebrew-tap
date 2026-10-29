# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.0/aws-cost-report_0.4.0_darwin_arm64.tar.gz"
      sha256 "1cb01661711347ef849208b41f968c38a16450ecd6196e500a8305574b4c09a0"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.0/aws-cost-report_0.4.0_darwin_amd64.tar.gz"
      sha256 "29556c558e436d94dad221f597c8e0811794f024bc859f56f5643e064c60e414"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.0/aws-cost-report_0.4.0_linux_arm64.tar.gz"
      sha256 "84f2a38c2ff15394ea44580a9ac1134c155eb1574e1bceb9ead5ea79b77e1cc1"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.0/aws-cost-report_0.4.0_linux_amd64.tar.gz"
      sha256 "f520aa19896a7666b6adfe86da0467dd8701e5373fdb33fd9000958efc995b0a"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
