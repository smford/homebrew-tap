# typed: false
# frozen_string_literal: true

# This formula was auto-generated for video-amplifier (https://github.com/smford/video-amplifier).
class VideoAmplifier < Formula
  desc "High-performance streaming proxy for IP cameras with zero-transcode fan-out"
  homepage "https://github.com/smford/video-amplifier"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/video-amplifier/releases/download/v#{version}/video-amplifier_#{version}_darwin_arm64.tar.gz"
      sha256 "7f1b9119ebe223513607cbf752584359208459e2285fe106c1f291d58738239b"
    end
    on_intel do
      url "https://github.com/smford/video-amplifier/releases/download/v#{version}/video-amplifier_#{version}_darwin_amd64.tar.gz"
      sha256 "108dc01571c7a7b347e147895187368614d0778fe7f516e81456d3d7c44f35b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/video-amplifier/releases/download/v#{version}/video-amplifier_#{version}_linux_arm64.tar.gz"
      sha256 "0191d47804118aab8009ca70e1b5a48926d7aabf41b888a37aba733ae378d135"
    end
    on_intel do
      url "https://github.com/smford/video-amplifier/releases/download/v#{version}/video-amplifier_#{version}_linux_amd64.tar.gz"
      sha256 "ceb8261504549039cc275944b83d29e3fe9f29e7e16eb29ab5a5fc5cb675c26a"
    end
  end

  def install
    bin.install "video-amplifier"
  end

  test do
    assert_match "video-amplifier version", shell_output("#{bin}/video-amplifier -version")
  end
end
