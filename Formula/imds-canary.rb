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
      sha256 "2e9ac3ee6bb13b4e08bb0e558114b90adbba9425201ea4a8ca00c2329cfee2ed"
    end
    on_intel do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_darwin_amd64.tar.gz"
      sha256 "43917762eb35a02d70ad9802db11ead48a0c6e330019d51472a8ae03e4c4b6de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_linux_arm64.tar.gz"
      sha256 "6916b5c1bf68e4f2a595cb7b935ad2980bc01d9f77511e4c65432058de6349e9"
    end
    on_intel do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_linux_amd64.tar.gz"
      sha256 "77800d7f0b4c037c62b049c202587c5fbf095b2344ba01c822300ede8d25914a"
    end
  end

  def install
    bin.install "imds-canary"
  end

  test do
    system "#{bin}/imds-canary", "-version"
  end
end
