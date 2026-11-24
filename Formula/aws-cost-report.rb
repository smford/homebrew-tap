# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.3/aws-cost-report_0.15.3_darwin_arm64.tar.gz"
      sha256 "0500f346ffb6fa290e208fb9a98c5d94a66c3db6369f7bc85fed87c53d6ca715"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.3/aws-cost-report_0.15.3_darwin_amd64.tar.gz"
      sha256 "2e858a41f5472fd4a24df4c31a1f0ea5bd1b18312e051eda3adde8bb9b0eeacd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.3/aws-cost-report_0.15.3_linux_arm64.tar.gz"
      sha256 "d9bf037f6f2d7933283078889c7a63dce63f4bc9eaee26a6d23837d9670fe8c4"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.3/aws-cost-report_0.15.3_linux_amd64.tar.gz"
      sha256 "f87cbcddc2c24019fa8269caa5e609b8d0085f3fcce81b599cf4870b6d61259f"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
