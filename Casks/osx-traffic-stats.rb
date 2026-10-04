cask "osx-traffic-stats" do
  version "1.2.4"
  sha256 "3f75bf19f71178a996258f785b6763f18d85ff5e1d42cc22da64c914b65a1e12"

  url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/OSXTrafficStats-v#{version}-macOS.zip"
  name "OSX Traffic Stats"
  desc "Real-time macOS menu bar network traffic monitor"
  homepage "https://github.com/smford/osx-traffic-stats"

  depends_on :macos

  app "OSXTrafficStats.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/OSXTrafficStats.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.smford.osx-traffic-stats",
    "~/Library/LaunchAgents/com.smford.osx-traffic-stats.plist",
  ]
end
