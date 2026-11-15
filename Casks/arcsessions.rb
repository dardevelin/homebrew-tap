cask "arcsessions" do
  version "0.20.0"
  sha256 "4b9a394c7277ad4d5d9471c17a8aeab9a40ead28c658e5573adf8b8ce042f1dc"

  url "https://github.com/dardevelin/arcsessions-releases/releases/download/v#{version}/ARCSessions-#{version}.dmg"
  name "ARCSessions"
  desc "Route, mix and record the audio of each app, with a virtual microphone"
  homepage "https://github.com/dardevelin/arcsessions-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "ARCSessions.app"

  uninstall quit: "com.arcsessions.app"

  zap trash: [
    "~/Library/Caches/com.arcsessions.app",
    "~/Library/Preferences/com.arcsessions.app.plist",
    "~/Library/Saved Application State/com.arcsessions.app.savedState",
  ]

  caveats <<~EOS
    ARC Mic (a microphone other apps can use) and ARC Speakers are optional.
    Install them from ARCSessions: Settings › Microphone › Install. It asks
    for an administrator password once.

    Before `brew uninstall --cask arcsessions`, remove them in
    Settings › Microphone › Remove ARC Mic & ARC Speakers: Homebrew doesn't.
    Your sessions in ~/.arcsessions are kept, also with --zap.

    Uninstalling, step by step:
      https://github.com/dardevelin/arcsessions-releases/blob/v#{version}/docs/UNINSTALL.md
  EOS
end
