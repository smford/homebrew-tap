# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mdee (https://github.com/smford/mdee).
class Mdee < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/mdee"
  version "1.7.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-arm64.tar.gz"
      sha256 "2d7f34df9989b2711faca57d2bd03f31e459ff5cab23b5e586487cb2a8003122"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-amd64.tar.gz"
      sha256 "2b6a4ec54fc6f91cff896bbfe2f425953f67ce863a5a19d0331d1f1ba241f54f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-arm64.tar.gz"
      sha256 "e6225f76c59c1303b4048050211df64e551b1c541328ebb844841258901cbc6f"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-amd64.tar.gz"
      sha256 "eb01251517f6d9909595bb86ff7f6f49775f32aa365170cdbc020abd7d776c39"
    end
  end

  def install
    bin.install "mdee"
  end

  test do
    assert_match "mdee version", shell_output("#{bin}/mdee --version")
  end
end
