# typed: false
# frozen_string_literal: true

# This formula was auto-generated for iam-shrink (https://github.com/smford/iam-shrink).
class IamShrink < Formula
  desc "Local-to-Least-Privilege AWS IAM Policy Generator"
  homepage "https://github.com/smford/iam-shrink"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_darwin_arm64.tar.gz"
      sha256 "f2a88453b9edc8a31ade17b51d46de4071067cdadc5fce38084c3b174616d804"
    end
    on_intel do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_darwin_amd64.tar.gz"
      sha256 "32977e163b58ea8273eef431f84813415062e5fba4845f6e30b58badedb32db1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_linux_arm64.tar.gz"
      sha256 "7afd8be1d8a0db02799d0c4c84d9e38affa1d2317a75d4874806ab27d0b104aa"
    end
    on_intel do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_linux_amd64.tar.gz"
      sha256 "025934d9d2c456d4103067250aef413c5333f0b87a0b2ffc75654c10d483cf6a"
    end
  end

  def install
    bin.install "iam-shrink"
  end

  test do
    assert_match "iam-shrink version", shell_output("#{bin}/iam-shrink version")
  end
end
