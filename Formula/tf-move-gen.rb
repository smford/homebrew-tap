# typed: false
# frozen_string_literal: true

# This formula was auto-generated for tf-move-gen (https://github.com/smford/tf-move-gen).
class TfMoveGen < Formula
  desc "Automated refactoring generator for Terraform and OpenTofu moved blocks"
  homepage "https://github.com/smford/tf-move-gen"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/tf-move-gen/releases/download/v#{version}/tf-move-gen_#{version}_darwin_arm64.tar.gz"
      sha256 "d164d183fe89fbbf53e48bf5dc4ccdb6b02ae554e2877c3b051bb3b3f3d91d47"
    end
    on_intel do
      url "https://github.com/smford/tf-move-gen/releases/download/v#{version}/tf-move-gen_#{version}_darwin_amd64.tar.gz"
      sha256 "d2f169dbb1ec67b7e0ed5a1aaa5c4bdc42f5201a6d657ec86d173c9db5926171"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/tf-move-gen/releases/download/v#{version}/tf-move-gen_#{version}_linux_arm64.tar.gz"
      sha256 "b610737da1415e5c13e0c516ee47724144be2941c77151269ae1e7e903f59823"
    end
    on_intel do
      url "https://github.com/smford/tf-move-gen/releases/download/v#{version}/tf-move-gen_#{version}_linux_amd64.tar.gz"
      sha256 "b02940985009a2cf860c2716f26a57302ef09d4c3662c074a88ec0927b14abf2"
    end
  end

  def install
    bin.install "tf-move-gen"
  end

  test do
    system "#{bin}/tf-move-gen", "--help"
  end
end
