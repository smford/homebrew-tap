# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mcp-jail (https://github.com/smford/mcp-jail).
class McpJail < Formula
  desc "Lightweight security proxy and flight recorder for Model Context Protocol (MCP) servers"
  homepage "https://github.com/smford/mcp-jail"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_arm64.tar.gz"
      sha256 "9ebd14857be447feeb8fc81098a8742d68a1bc16c9c4ee6eb8bdf0272969ab23"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_amd64.tar.gz"
      sha256 "75e8271b68f41966011ed62f6b054f74dcd63c0c74d8be9c20bbd12a433cb2bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_arm64.tar.gz"
      sha256 "e557aa209973033bd164ae5d1d4508ab3b88a8cbaeba803b5e8f17259d14e8ad"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_amd64.tar.gz"
      sha256 "205dc9b54d7a37dc9d410c6d26eca0fc1acbb7be715a2d22d8c108fdcc6b5e08"
    end
  end

  def install
    bin.install "mcp-jail"
  end

  test do
    system "#{bin}/mcp-jail", "--help"
  end
end
