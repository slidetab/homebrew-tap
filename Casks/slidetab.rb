cask "slidetab" do
  version "1.0"
  sha256 "efea505dc55e9ddd630138f844d3f775cb74a0475d85dcf757feb045ac31a2e8"

  # Versioned artifact so an uploaded newer DMG can never break `brew install` with a checksum mismatch.
  url "https://slidetab.app/download/SlideTab-#{version}.dmg"
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

  uninstall quit:           "com.slidetab.macos",
            login_item:     "SlideTab",
            launchctl:      "com.slidetab.macos"

  # `brew uninstall --zap` removes everything, including the trial anchors that a plain uninstall deliberately keeps.
  zap trash: [
    "~/Library/Preferences/com.slidetab.macos.plist",
    "~/Library/Saved Application State/com.slidetab.macos.savedState",
    "~/Library/Application Support/com.slidetab.macos",
    "~/Library/Caches/com.slidetab.macos",
    "~/Library/Logs/SlideTab",
  ]
end
