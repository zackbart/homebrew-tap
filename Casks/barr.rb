cask "barr" do
  version "0.0.4"
  sha256 "508dcc620baf3e30d0dee7bb0c0697c93cd75f5027f24e1daaf23e175e1b2d35"

  url "https://github.com/zackbart/barr/releases/download/v#{version}/Barr-#{version}.dmg"
  name "Barr"
  desc "Dropdown shelf for menu bar apps"
  homepage "https://github.com/zackbart/barr"

  depends_on macos: :sonoma

  app "Barr.app"

  zap trash: "~/Library/Preferences/com.cursorkittens.Barr.plist"
end
