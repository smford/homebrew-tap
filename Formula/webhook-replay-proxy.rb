# typed: false
# frozen_string_literal: true

# This formula was auto-generated for webhook-replay-proxy (https://github.com/smford/webhook-replay-proxy).
class WebhookReplayProxy < Formula
  desc "Production-grade webhook capture, replay, and inspection proxy"
  homepage "https://github.com/smford/webhook-replay-proxy"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_darwin_arm64.tar.gz"
      sha256 "e4de8d2c334cdd94e1508bb0b6caba853e9cbc90828b6cc457fed6d80e76ed73"
    end
    on_intel do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_darwin_amd64.tar.gz"
      sha256 "840be5699686df7ae0143b914d16ffc7d5138f822ddd686e339c86480e51f520"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_linux_arm64.tar.gz"
      sha256 "e5c0ba04b3c643adcb5933edde5c336ad24d9f165a1877590921d8ae1264cb87"
    end
    on_intel do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_linux_amd64.tar.gz"
      sha256 "42d19a4d6db3a83576fe212b481c64baa460d6891457fb4a61dc11b31c3c327a"
    end
  end

  def install
    bin.install "webhook-replay-proxy"
  end

  test do
    assert_match "webhook-replay-proxy", shell_output("#{bin}/webhook-replay-proxy --version")
  end
end
