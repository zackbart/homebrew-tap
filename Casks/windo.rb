cask "windo" do
  version "0.1.6"
  sha256 "199ea4d57eced9042d0dde9e5f4128fd2c285c8aa003024e1f503c3ac072fdd6"

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
