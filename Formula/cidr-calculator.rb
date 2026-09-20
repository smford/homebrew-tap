# typed: false
# frozen_string_literal: true

# This formula was auto-generated for cidr-calculator (https://github.com/smford/cidr-calculator).
class CidrCalculator < Formula
  desc "Convert IP ranges into minimal CIDR blocks with subnet intelligence"
  homepage "https://github.com/smford/cidr-calculator"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/cidr-calculator/releases/download/v#{version}/cidr-calculator_#{version}_darwin_arm64.tar.gz"
      sha256 "bd3e4eb490af0ee829fd2a4758957c3f67b59dbf93cfe704aeb32a5c62cecf52"
    end
    on_intel do
      url "https://github.com/smford/cidr-calculator/releases/download/v#{version}/cidr-calculator_#{version}_darwin_amd64.tar.gz"
      sha256 "c101090c627014d8076786de30c75307e6f75753bea3aec796dbf8a737e6b8af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/cidr-calculator/releases/download/v#{version}/cidr-calculator_#{version}_linux_arm64.tar.gz"
      sha256 "5ab414570c52ffbc5b2451046e549c47752114c9d56d5b300466808acab95910"
    end
    on_intel do
      url "https://github.com/smford/cidr-calculator/releases/download/v#{version}/cidr-calculator_#{version}_linux_amd64.tar.gz"
      sha256 "6a4113163b27a0d7a5a6d3a2b89072654ac5561a3ddb5d8f0e9cb41e2de3c862"
    end
  end

  def install
    bin.install "cidr-calculator"
    generate_completions_from_executable(bin/"cidr-calculator", "completion")
  end

  test do
    assert_match "192.168.1.10/31", shell_output("#{bin}/cidr-calculator 192.168.1.10+1")
  end
end
