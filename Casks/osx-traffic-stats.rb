cask "osx-traffic-stats" do
  version "1.2.0"
  sha256 "27d4a51fda5e738a675c615a796b1e343981d01ed0a7670a8ccf46b5a8f1c22e"

  url "https://github.com/smford/osx-traffic-stats/releases/download/v#{version}/OSXTrafficStats-v#{version}-macOS.zip"
  name "OSX Traffic Stats"
  desc "Real-time macOS menu bar network traffic monitor"
  homepage "https://github.com/smford/osx-traffic-stats"

  depends_on macos: ">= :high_sierra"

  app "OSXTrafficStats.app"

  zap trash: [
    "~/Library/Application Support/com.smford.osx-traffic-stats",
    "~/Library/LaunchAgents/com.smford.osx-traffic-stats.plist",
  ]
end
