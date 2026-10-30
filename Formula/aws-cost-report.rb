# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.13.0/aws-cost-report_0.13.0_darwin_arm64.tar.gz"
      sha256 "2b8c5c0f1c988147f73572ed53104d4080360a4096ef64f6a76439eb39f309d8"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.13.0/aws-cost-report_0.13.0_darwin_amd64.tar.gz"
      sha256 "aa9b911b762a547e7c7c37162fb30cc02545e5ab1a271a0e89e24e7ef047624e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.13.0/aws-cost-report_0.13.0_linux_arm64.tar.gz"
      sha256 "6862b55042ac9c54a325ff4f333d13cd17f31ef6c401b40e3afc035b70de1e66"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.13.0/aws-cost-report_0.13.0_linux_amd64.tar.gz"
      sha256 "d8c7ce558067600b82838e468a08a2837477e3185e41d7f4b564a7777e19a1af"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
