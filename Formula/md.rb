# typed: false
# frozen_string_literal: true

# This formula was auto-generated for md (https://github.com/smford/md).
class Md < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/md"
  version "1.1.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-darwin-arm64.tar.gz"
      sha256 "75fd0122a4de1d27f52b8fcc7a8fdd941c622bffb8600ef8d0c04e0bdc5845b0"
    end
    on_intel do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-darwin-amd64.tar.gz"
      sha256 "5bf5ca560d5c6645498fd8cc79e93b9fb8b9073e7602f0f5f7a92a8866fb0e66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-linux-arm64.tar.gz"
      sha256 "447abf671f6a108e3d19b6e1df04763bfd5bebc9ee5f121b4d452f76beca2b27"
    end
    on_intel do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-linux-amd64.tar.gz"
      sha256 "16cf0ababcc1c674a968a1920e46f70a55310fb2ebe8916fdd307e4c2ad30bbb"
    end
  end

  def install
    bin.install "md"
  end

  test do
    assert_match "md version", shell_output("#{bin}/md --version")
  end
end
