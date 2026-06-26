cask "windo" do
  version "0.1.3"
  sha256 "e478db2dd642aa5d3d43b703d736e50cff6e0b50f9707b6b380bf742b64f5609"

  url "https://github.com/zackbart/windo/releases/download/v#{version}/Windo-#{version}.dmg",
      verified: "github.com/zackbart/windo/"
  name "Windo"
  desc "Floating, always-on-top web window for watching video over other apps"
  homepage "https://github.com/zackbart/windo"

  depends_on macos: :tahoe

  app "Windo.app"

  zap trash: [
    "~/Library/Preferences/dev.zackbart.windo.plist",
  ]
end
