# typed: false
# frozen_string_literal: true

# This formula was auto-generated for delim (https://github.com/smford/delim).
class Delim < Formula
  desc "Creates a visual line to aid in reading terminal screens"
  homepage "https://github.com/smford/delim"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/delim/releases/download/v#{version}/delim-v#{version}-darwin-arm64.tar.gz"
      sha256 "29988ddf0b4038b43ec9a1e93ece2d8cef7f661cccf5209c7e570ec6ecfa0538"
    end
    on_intel do
      url "https://github.com/smford/delim/releases/download/v#{version}/delim-v#{version}-darwin-amd64.tar.gz"
      sha256 "d73bb33c07cf7fa40a46c919ce96a94a74155abea280a1e7acb08be6a9a70fb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/delim/releases/download/v#{version}/delim-v#{version}-linux-arm64.tar.gz"
      sha256 "1138e1b626e7ad36ef95c032b8d5294da194808c4bf562f436d08d1cace00aec"
    end
    on_intel do
      url "https://github.com/smford/delim/releases/download/v#{version}/delim-v#{version}-linux-amd64.tar.gz"
      sha256 "29d9d067e5caf8ec0edf557425175f3ae4a761e0929af503da7d5e19a9d701b4"
    end
  end

  def install
    bin.install "delim"
  end

  test do
    assert_match "delim", shell_output("#{bin}/delim --version")
  end
end
