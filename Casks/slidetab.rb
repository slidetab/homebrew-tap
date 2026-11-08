cask "slidetab" do
  version "1.0"
  sha256 "e3ebaa16dd9d9b9fc107c42183fb6cf9d22927e1af03dbbdfa0ccc38e4e4ac31"

  url "https://slidetab.app/download/SlideTab.dmg"
  name "SlideTab"
  desc "Tactile trackpad window & app switcher with Force Touch haptics"
  homepage "https://slidetab.app"

  livecheck do
    url "https://slidetab.app/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :sonoma

  app "SlideTab.app"

  uninstall quit: "com.slidetab.macos"

  zap trash: [
    "~/Library/Preferences/com.slidetab.macos.plist",
    "~/Library/Saved Application State/com.slidetab.macos.savedState",
  ]
end
