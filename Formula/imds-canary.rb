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
      sha256 "0683a8ac7c7079a90036133b77e05d26bbb2c14996365b9c2b12ac90cac35777"
    end
    on_intel do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_darwin_amd64.tar.gz"
      sha256 "01575a4b25cac772a3929e7045877b327693b524ac0408265080f90bec3efc48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_linux_arm64.tar.gz"
      sha256 "070ad800df6266736e42731a50e2176fc9ac1c0e4c1bcb14794aa5a34c2f981d"
    end
    on_intel do
      url "https://github.com/smford/imds-canary/releases/download/v#{version}/imds-canary_#{version}_linux_amd64.tar.gz"
      sha256 "b25503815ba4dc82434547937fe6a1535edaf3d3b9dfb5a65324fa042af18f61"
    end
  end

  def install
    bin.install "imds-canary"
  end

  test do
    system "#{bin}/imds-canary", "-version"
  end
end
