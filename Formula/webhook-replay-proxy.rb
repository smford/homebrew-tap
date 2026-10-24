# typed: false
# frozen_string_literal: true

# This formula was auto-generated for webhook-replay-proxy (https://github.com/smford/webhook-replay-proxy).
class WebhookReplayProxy < Formula
  desc "Production-grade webhook capture, replay, and inspection proxy"
  homepage "https://github.com/smford/webhook-replay-proxy"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_darwin_arm64.tar.gz"
      sha256 "6e7e45c8d2f58a487623fbc8c90a70f8997ed59753814dd9d04f1d47c7d36630"
    end
    on_intel do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_darwin_amd64.tar.gz"
      sha256 "71a0a97b2d1e9350cb69f3eb09de0af874d6ee4f798736ff9d1b516b0333037f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_linux_arm64.tar.gz"
      sha256 "0ca3f3e01360b078e2951af997e154b82b2b59d33bd519f61551906771839860"
    end
    on_intel do
      url "https://github.com/smford/webhook-replay-proxy/releases/download/v#{version}/webhook-replay-proxy_#{version}_linux_amd64.tar.gz"
      sha256 "2eff0034f68a60399b0a76c6bc92af164ea925750264bf3eb98c76878e54d7b3"
    end
  end

  def install
    bin.install "webhook-replay-proxy"
  end

  test do
    assert_match "webhook-replay-proxy", shell_output("#{bin}/webhook-replay-proxy --version")
  end
end
