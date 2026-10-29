# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_darwin_arm64.tar.gz"
      sha256 "51303e1e5853adbe760ec096c94a4be846e0a0e5726735eba0e202e07239f548"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_darwin_amd64.tar.gz"
      sha256 "33ea2838049b13d432c81524d707a6de7546055cb18525819382fed88a952eb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_linux_arm64.tar.gz"
      sha256 "d7337183c35f90543164bc8df8db192fe50ada9f98b51afeb7d5bb63f0676ba3"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.9.0/aws-cost-report_0.9.0_linux_amd64.tar.gz"
      sha256 "44728941cb17ea9de9149e94c8c9114b5b9680c489eeddad215ebfef621a34c1"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
