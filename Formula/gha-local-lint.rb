# typed: false
# frozen_string_literal: true

# This formula was auto-generated for gha-local-lint (https://github.com/smford/gha-local-lint).
class GhaLocalLint < Formula
  desc "Offline GitHub Actions Expression Evaluator, Matrix Expander, & Pipeline Simulator"
  homepage "https://github.com/smford/gha-local-lint"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_darwin_arm64.tar.gz"
      sha256 "add6530941de26df5df62d340f1f378303c881897a2c041e11d78416bfdcd4cb"
    end
    on_intel do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_darwin_amd64.tar.gz"
      sha256 "62e2b5e2167c55ce395cb4002893fb1f8b4ede25bec01b4adc5e7d25a3df60c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_linux_arm64.tar.gz"
      sha256 "769e6941c5ea34fee90b74ee48d2658e16bb50f26721b05f9b4040d9d4cc9b36"
    end
    on_intel do
      url "https://github.com/smford/gha-local-lint/releases/download/v0.5.0/gha-local-lint_0.5.0_linux_amd64.tar.gz"
      sha256 "183670986b028ca4dd0c362a50a50616523040193bae8ce338a1c0add0f667c3"
    end
  end

  def install
    bin.install "gha-local-lint"
  end

  test do
    assert_match "gha-local-lint", shell_output("#{bin}/gha-local-lint version")
  end
end
