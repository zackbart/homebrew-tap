cask "loadout" do
  version "0.0.3"
  sha256 "a3a3c1d3f88cc0d1b7e2aa6e86ff69a8a9b2cbbac1469400d27249f12ec32f10"

  url "https://github.com/zackbart/loadout/releases/download/v#{version}/Loadout-#{version}.dmg",
      verified: "github.com/zackbart/loadout/"
  name "Loadout"
  desc "See every AI-agent skill and MCP server configured on your machine"
  homepage "https://github.com/zackbart/loadout"

  depends_on macos: :tahoe

  app "Loadout.app"

  zap trash: [
    "~/Library/Caches/dev.zackbart.loadout",
    "~/Library/Preferences/dev.zackbart.loadout.plist",
  ]
end
