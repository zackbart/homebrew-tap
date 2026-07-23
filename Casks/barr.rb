cask "barr" do
  version "0.0.3"
  sha256 "8eab659a9d97d57a2350333a030f3d692595d9cfdb976029177abec301981975"

  url "https://github.com/zackbart/barr/releases/download/v#{version}/Barr-#{version}.dmg"
  name "Barr"
  desc "Dropdown shelf for menu bar apps"
  homepage "https://github.com/zackbart/barr"

  depends_on macos: :sonoma

  app "Barr.app"

  zap trash: "~/Library/Preferences/com.cursorkittens.Barr.plist"
end
