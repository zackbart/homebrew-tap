cask "barr" do
  version "0.0.1"
  sha256 "709f28ae91509b3321c1ed3d039ae8308b43baf252990a4119603be20fc00f24"

  url "https://github.com/zackbart/barr/releases/download/v#{version}/Barr-#{version}.dmg",
      verified: "github.com/zackbart/barr/"
  name "Barr"
  desc "Dropdown shelf for menu bar apps"
  homepage "https://github.com/zackbart/barr"

  depends_on macos: :sonoma

  app "Barr.app"

  zap trash: "~/Library/Preferences/com.cursorkittens.Barr.plist"
end
