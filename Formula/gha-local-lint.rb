# typed: false
# frozen_string_literal: true

# This formula was auto-generated for gha-local-lint (https://github.com/smford/gha-local-lint).
class GhaLocalLint < Formula
  desc "Offline GitHub Actions Expression Evaluator, Matrix Expander, & Pipeline Simulator"
  homepage "https://github.com/smford/gha-local-lint"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.4.0/gha-local-lint_0.4.0_darwin_arm64.tar.gz"
      sha256 "98bed8a80b098409544b979a66a6a593f193c63178f67abb6ed611c07f915273"
    end
    on_intel do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.4.0/gha-local-lint_0.4.0_darwin_amd64.tar.gz"
      sha256 "7c8e0d57685adb565b17a7f1115940371e0869d2de9bfe09599182f6b376a61b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.4.0/gha-local-lint_0.4.0_linux_arm64.tar.gz"
      sha256 "e85542f557ac1f3b72dca10357c2dccf97d43091ea410e98d114495e87876178"
    end
    on_intel do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.4.0/gha-local-lint_0.4.0_linux_amd64.tar.gz"
      sha256 "a56f055f637559b92492cde7173f5eae25628f1d5ecb89bd7bb57308a62ca27f"
    end
  end

  def install
    bin.install "gha-local-lint"
  end

  test do
    assert_match "gha-local-lint", shell_output("#{bin}/gha-local-lint version")
  end
end
