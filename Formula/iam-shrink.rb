# typed: false
# frozen_string_literal: true

# This formula was auto-generated for iam-shrink (https://github.com/smford/iam-shrink).
class IamShrink < Formula
  desc "Local-to-Least-Privilege AWS IAM Policy Generator"
  homepage "https://github.com/smford/iam-shrink"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_darwin_arm64.tar.gz"
      sha256 "563233c52497ec0a61811aa2f4e1d0cce041be3e83b16b0580c8e66d26d31273"
    end
    on_intel do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_darwin_amd64.tar.gz"
      sha256 "44d9d8ccba6115042451cdc86cb535d0cd8f331d43989e191ea7a1305e2f24c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_linux_arm64.tar.gz"
      sha256 "2afc4e47be3dc8548829f43c648c913d1071e44e083cbadc72fd16e44a6ed997"
    end
    on_intel do
      url "https://github.com/smford/iam-shrink/releases/download/v#{version}/iam-shrink_#{version}_linux_amd64.tar.gz"
      sha256 "7ec65118f47b627702d64edea6e0481bf7069d1ceadc68e4423f05ff86e58ea9"
    end
  end

  def install
    bin.install "iam-shrink"
  end

  test do
    assert_match "iam-shrink version", shell_output("#{bin}/iam-shrink version")
  end
end
