# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mdee (https://github.com/smford/mdee).
class Mdee < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/mdee"
  version "1.5.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-arm64.tar.gz"
      sha256 "b9acc77762dcd86aaa58f7e2b333541cce12b0b8bb50605a9736487b587070e7"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-amd64.tar.gz"
      sha256 "759be0049d5e086efce8e62f43d5806180a52bc04b914fba5fbebe931baf00a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-arm64.tar.gz"
      sha256 "cac1fcf4bc98bc03d95acce960eeb1983f7e9e4dcfdb0a5af2d01eca0408882d"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-amd64.tar.gz"
      sha256 "51327b5a612c419943bd3cde3c51e69686869cf73bf5f42378be4035354942dc"
    end
  end

  def install
    bin.install "mdee"
  end

  test do
    assert_match "mdee version", shell_output("#{bin}/mdee --version")
  end
end
