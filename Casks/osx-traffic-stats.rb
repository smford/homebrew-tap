cask "osx-traffic-stats" do
  version "1.2.3"
  sha256 "0d94a2781e66c43149e60e2a3b090fb3126af6dcf76751978f536946df241cd7"

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
