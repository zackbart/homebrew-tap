cask "barr" do
  version "0.0.2"
  sha256 "98c2c9d2d4b1b663018e453c7d43eddc6cdbba57337394a1f8bae67951953dd0"

  url "https://github.com/zackbart/barr/releases/download/v#{version}/Barr-#{version}.dmg"
  name "Barr"
  desc "Dropdown shelf for menu bar apps"
  homepage "https://github.com/zackbart/barr"

  depends_on macos: :sonoma

  app "Barr.app"

  zap trash: "~/Library/Preferences/com.cursorkittens.Barr.plist"
end
