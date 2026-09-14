# typed: false
# frozen_string_literal: true

# This formula was auto-generated for md (https://github.com/smford/md).
class Md < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/md"
  version "1.2.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-darwin-arm64.tar.gz"
      sha256 "d01feff250fbb0691f4f04db6608356bd2437ff7d85b062ceaeaf9e6c7ab1d2e"
    end
    on_intel do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-darwin-amd64.tar.gz"
      sha256 "135d9f6a41c6dc9594aeee452549d65cb62675452db5127d082bd0f1701a4ffe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-linux-arm64.tar.gz"
      sha256 "2b17c2ca596ac5acfcdd4dda40ce010fb757541f83181fe9dca1f746b462d18d"
    end
    on_intel do
      url "https://github.com/smford/md/releases/download/v#{version}/md-v#{version}-linux-amd64.tar.gz"
      sha256 "1cede319eca0aa41ceab922d122ce16ae86c2809bb0069ab354b07036bd52c93"
    end
  end

  def install
    bin.install "md"
  end

  test do
    assert_match "md version", shell_output("#{bin}/md --version")
  end
end
