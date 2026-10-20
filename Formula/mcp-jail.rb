# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mcp-jail (https://github.com/smford/mcp-jail).
class McpJail < Formula
  desc "Lightweight security proxy and flight recorder for Model Context Protocol (MCP) servers"
  homepage "https://github.com/smford/mcp-jail"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_arm64.tar.gz"
      sha256 "c170bdb2872f771482425540000751b32972aeee4ca3ed744654814bf139de28"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_amd64.tar.gz"
      sha256 "9272899d1d90ffc79401f5a3b9b65999cba448bb7bc7d2333997f4e8fb26fe28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_arm64.tar.gz"
      sha256 "ad447743c00b3907be56aa3161e1526830ba13679cc01f510bde5f4ebbb60a9c"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_amd64.tar.gz"
      sha256 "fbee4c57864ce31091b938cf5cfc78ea92ab9412cbd79bf60f9c22536dc9938f"
    end
  end

  def install
    bin.install "mcp-jail"
  end

  test do
    system "#{bin}/mcp-jail", "--help"
  end
end
