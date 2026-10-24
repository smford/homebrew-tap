# typed: false
# frozen_string_literal: true

# This formula was auto-generated for imds-canary (https://github.com/smford/imds-canary).
class ImdsCanary < Formula
  desc "eBPF AWS IMDS Canary & Process Attribution Daemon"
  homepage "https://github.com/smford/imds-canary"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_darwin_arm64.tar.gz"
      sha256 "d48b1ca01f8dc0efec94d0d82d0150a3b65456fd493241965354d109baa26f28"
    end
    on_intel do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_darwin_amd64.tar.gz"
      sha256 "61b5b6e5a21a9885e043e819a14a839340b8240d72b74493342e15ffa47fd952"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_linux_arm64.tar.gz"
      sha256 "9451b7f09d4ff36f7dc31cb0bab6939d46a29f246ced656685473bc11522ba4f"
    end
    on_intel do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_linux_amd64.tar.gz"
      sha256 "3a86173cb11966ae1041b3f9fbe0d9c4e3ec28676b9b2387cb0ef3d7dd67e54c"
    end
  end

  def install
    bin.install "imds-canary"
  end

  test do
    system "#{bin}/imds-canary", "-version"
  end
end
