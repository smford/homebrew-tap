# typed: false
# frozen_string_literal: true

# This formula was auto-generated for aws-cost-report (https://github.com/smford/aws-cost-report).
class AwsCostReport < Formula
  desc "AWS Cost & Usage reporting CLI and service"
  homepage "https://github.com/smford/aws-cost-report"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.1/aws-cost-report_0.4.1_darwin_arm64.tar.gz"
      sha256 "a76ab2887448c2b58671ec231023d0d4b6e509d3a229883770af71082412272d"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.1/aws-cost-report_0.4.1_darwin_amd64.tar.gz"
      sha256 "22a4dfa75f808ae5e22f936b08dac6661f905a6801e8463fafc9342394b4c593"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.1/aws-cost-report_0.4.1_linux_arm64.tar.gz"
      sha256 "7d2f843fb096c4274bd1e70a61713a2f308585126aed8c5c47910419277044d0"
    end
    on_intel do
      url "https://github.com/smford/aws-cost-report/releases/download/v0.4.1/aws-cost-report_0.4.1_linux_amd64.tar.gz"
      sha256 "d3d48a116b3927d180649ec86d49ef716c5db5a150c64eb484c2a97b00d7f0fe"
    end
  end

  def install
    bin.install "aws-cost-report"
  end

  test do
    assert_match "aws-cost-report", shell_output("#{bin}/aws-cost-report --version")
  end
end
