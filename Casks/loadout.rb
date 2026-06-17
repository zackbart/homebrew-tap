cask "loadout" do
  version "0.0.1"
  sha256 "262e1a22449fe2255ecb8e9a8db3bd4426b531e252b5a97bbebfdc528cf3129b"

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
