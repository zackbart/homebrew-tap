cask "barr" do
  version "0.0.5"
  sha256 "6b231c237e0345b0eee3011f41b6932f02dc209768c74495252e926cd1edbc3f"

  url "https://github.com/zackbart/barr/releases/download/v#{version}/Barr-#{version}.dmg"
  name "Barr"
  desc "Dropdown shelf for menu bar apps"
  homepage "https://github.com/zackbart/barr"

  depends_on macos: :sonoma

  app "Barr.app"

  zap trash: "~/Library/Preferences/com.cursorkittens.Barr.plist"
end
