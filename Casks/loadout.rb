cask "loadout" do
  version "0.1.1"
  sha256 "92b33cca1b9fd617390874dca8aa4ee2f6f72411146204afa6ef63fb59f20a5c"

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
