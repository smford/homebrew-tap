cask "osx-traffic-stats" do
  version "1.2.2"
  sha256 "276ae2e01a24ad1e28124ae903b8b2329008550422ca3b71ae3eb354e7633462"

  url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/OSXTrafficStats-v#{version}-macOS.zip"
  name "OSX Traffic Stats"
  desc "Real-time macOS menu bar network traffic monitor"
  homepage "https://github.com/smford/osx-traffic-stats"

  depends_on :macos

  app "OSXTrafficStats.app"

  zap trash: [
    "~/Library/Application Support/com.smford.osx-traffic-stats",
    "~/Library/LaunchAgents/com.smford.osx-traffic-stats.plist",
  ]
end
