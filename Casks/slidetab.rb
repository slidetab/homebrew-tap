cask "slidetab" do
  version "1.9"
  sha256 "5c49b57f9e7a52b46e7683efcb0987d7576527cc0090af56eef2562bbf2432bd"

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
