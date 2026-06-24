cask "windo" do
  version "0.1.1"
  sha256 "0c97b3e24a76bea9a7e9c611b57a87defc1105ab8086c6f337d6b780dfb13b57"

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
