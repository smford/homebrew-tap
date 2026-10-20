# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mcp-jail (https://github.com/smford/mcp-jail).
class McpJail < Formula
  desc "Lightweight security proxy and flight recorder for Model Context Protocol (MCP) servers"
  homepage "https://github.com/smford/mcp-jail"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_arm64.tar.gz"
      sha256 "a4251c81c2d28eb8b79c42dc4d0b6078584e4fe1e3c3a68b32083dc5254b41fd"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_amd64.tar.gz"
      sha256 "3da3d682bacec68ea53b94c8b949c334b177f07b4d02d3a49abd7c087d48a6bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_arm64.tar.gz"
      sha256 "4ed978a714692b520939448c459da0aee75c4bf2996dddc58e0ee25dcb2827b4"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_amd64.tar.gz"
      sha256 "593390345134d26d65800f1a2d2a4794297f42391bb042f219efcc86b58dee0b"
    end
  end

  def install
    bin.install "mcp-jail"
  end

  test do
    system "#{bin}/mcp-jail", "--help"
  end
end
