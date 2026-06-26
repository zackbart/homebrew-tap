cask "windo" do
  version "0.1.2"
  sha256 "59148ed1d9e7a0e876f213aba9d4e0517c356c1e1ed721d501a82a0b2dd7e631"

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
