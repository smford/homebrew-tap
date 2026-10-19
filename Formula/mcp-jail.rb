# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mcp-jail (https://github.com/smford/mcp-jail).
class McpJail < Formula
  desc "Lightweight security proxy and flight recorder for Model Context Protocol (MCP) servers"
  homepage "https://github.com/smford/mcp-jail"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_arm64.tar.gz"
      sha256 "2dd981db318194014ec6fd23c74c74fefa2ffa0eb5372e9813e61209222412a2"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_amd64.tar.gz"
      sha256 "b57bc7d23d479975545298bb5014076a9d78c74f016589e04d9a4a40cca57b4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_arm64.tar.gz"
      sha256 "e6502c7c0577fe69879a834c28d500e620125ebaf9abe23351b7bddd0856d906"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_amd64.tar.gz"
      sha256 "bd07fb4b1b8e28464edda8ae393f4be8e2bf39d176c6444aba09abb32052416b"
    end
  end

  def install
    bin.install "mcp-jail"
  end

  test do
    system "#{bin}/mcp-jail", "--help"
  end
end
