# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.0/aws-cost-report_0.15.0_darwin_arm64.tar.gz"
      sha256 "003722bb2608b5eaff27f6a1b112b9a8dfc57635bd02b9c19c6053322cb09244"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.0/aws-cost-report_0.15.0_darwin_amd64.tar.gz"
      sha256 "a10212ee288ffa4bae712d117c22526efe2ece364610bbb0a72a8a7688b9ba86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.0/aws-cost-report_0.15.0_linux_arm64.tar.gz"
      sha256 "81f4c3c5c46e97676d4fe8f81272bcd7b8d7cb9e52c226efd5c988f2859d433f"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.15.0/aws-cost-report_0.15.0_linux_amd64.tar.gz"
      sha256 "8ecf3d17cca7dc22d008a615f1f0b0c2678dfc2a2b535b3288ad983d8700d4b0"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
