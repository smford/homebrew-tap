# typed: false
# frozen_string_literal: true

# This formula was auto-generated for webhook-replay-proxy (https://github.com/smford/webhook-replay-proxy).
class WebhookReplayProxy < Formula
  desc "Production-grade webhook capture, replay, and inspection proxy"
  homepage "https://github.com/smford/webhook-replay-proxy"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_darwin_arm64.tar.gz"
      sha256 "8fed3e6c291a49e0a286f7219af07b601bfbce5f692b60285ae83b514a0f9419"
    end
    on_intel do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_darwin_amd64.tar.gz"
      sha256 "22e8ebf0f1bd9285ae806ea4672541dbbba3d06139d819be5bb45065452e45a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_linux_arm64.tar.gz"
      sha256 "d3363accd6195a2e76fc0aef8668b5df083db396106c574ac658b5cf8bca379b"
    end
    on_intel do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_linux_amd64.tar.gz"
      sha256 "3f8b091f805d4eb392e2ca68a8f8aea739909037aa7ca67e06c9aa82b6b700c7"
    end
  end

  def install
    bin.install "webhook-replay-proxy"
  end

  test do
    assert_match "webhook-replay-proxy", shell_output("#{bin}/webhook-replay-proxy --version")
  end
end
