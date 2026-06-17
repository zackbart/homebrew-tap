cask "loadout" do
  version "0.0.2"
  sha256 "730637f259ee0741272745461b5af7f9f8757556ec337a87ba0953f11bbd704c"

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
