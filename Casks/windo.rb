cask "windo" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
