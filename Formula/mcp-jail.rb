# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mcp-jail (https://github.com/smford/mcp-jail).
class McpJail < Formula
  desc "Zero-CGO local firewall and flight-recorder proxy for Model Context Protocol (MCP) servers"
  homepage "https://github.com/smford/mcp-jail"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_arm64.tar.gz"
      sha256 "0915f3de54e7e8ec7f3b538ce7a5fc31b8bf1359a93d402630f6d4d5356db74f"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_darwin_amd64.tar.gz"
      sha256 "85255b562cc770051dc2f4d24f99b78b0f008f92ce46cabc50b427161b458814"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_arm64.tar.gz"
      sha256 "f3b9340dec8e0c4e849ab077a0aae22b6726a969cda002ed0776f10398c9a865"
    end
    on_intel do
      url "https://github.com/smford/mcp-jail/releases/download/v#{version}/mcp-jail_#{version}_linux_amd64.tar.gz"
      sha256 "fd3af1fd4775349cd155e7d8b317932af336cf5acf469686bf9c3551453a8c3e"
    end
  end

  def install
    bin.install "mcp-jail"
  end

  test do
    system "#{bin}/mcp-jail", "--help"
  end
end
