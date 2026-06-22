cask "loadout" do
  version "0.0.4"
  sha256 "dc8a443353117ff8273963502b267645ca9748d6a363b1b2606ea803698dea90"

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
