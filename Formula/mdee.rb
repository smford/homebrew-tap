# typed: false
# frozen_string_literal: true

# This formula was auto-generated for mdee (https://github.com/smford/mdee).
class Mdee < Formula
  desc "Terminal Markdown viewer for macOS iTerm2"
  homepage "https://github.com/smford/mdee"
  version "1.2.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-arm64.tar.gz"
      sha256 "51b209097426563d222a4dd523eae8501027302717cdb4480eac418fd7d3629c"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-darwin-amd64.tar.gz"
      sha256 "a643d20aa55b49acbef9afa5995ae7e02c36873c782941d33dde3428c5f7ccb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-arm64.tar.gz"
      sha256 "94cff5ac4bd1f010c5c76c4a698db1c1742ed7c34302d875589bf0e1ca492754"
    end
    on_intel do
      url "https://github.com/smford/mdee/releases/download/v#{version}/mdee-v#{version}-linux-amd64.tar.gz"
      sha256 "20d361c43501ef6c027acdfa7ae398e5a6f1314bc5febcf24880e86e6c762d6c"
    end
  end

  def install
    bin.install "mdee"
  end

  test do
    assert_match "mdee version", shell_output("#{bin}/mdee --version")
  end
end
