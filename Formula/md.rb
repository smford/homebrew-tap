# typed: false
# frozen_string_literal: true

# This formula was auto-generated for md (https://github.com/smford/md).
class Md < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/md"
  version "1.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-darwin-arm64.tar.gz"
      sha256 "84d54ed5d41eb923d6f2f48cb3b7444e3b018e50d42e65cb080f23b4c1991adc"
    end
    on_intel do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-darwin-amd64.tar.gz"
      sha256 "33b9cea166bcd38167f731c24b626aa2e836c6219f522ca86c44bc96555fb342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-linux-arm64.tar.gz"
      sha256 "551219197f1b1f3d57c6eb7dcec74312cd33e2d594e27b7b616aa83134042a41"
    end
    on_intel do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-linux-amd64.tar.gz"
      sha256 "df28c9acf0713bbcf71c70a6415e635b336c069eff3aa68cdd1df881dc6230ab"
    end
  end

  def install
    bin.install "md"
  end

  test do
    assert_match "md version", shell_output("#{bin}/md --version")
  end
end
