cask "clwokki" do
  version "0.25.1"
  sha256 "6842d4abd0b1f3cbf5ace044702a40ed297a4ef0dde0e09aa4033da91d71c2b9"

  url "https://github.com/dardevelin/clwokki-releases/releases/download/clwokki-v#{version}/clwokki-#{version}-macos.zip"
  name "clwokki"
  desc "Voice and chat on Mumble servers from the terminal and the menu bar"
  homepage "https://github.com/dardevelin/clwokki-releases"

  depends_on macos: :golden_gate

  app "clwokki.app"
  binary "#{appdir}/clwokki.app/Contents/MacOS/clwokki"

  uninstall launchctl: "com.wokkiapp.clwokki",
            quit:      "com.wokkiapp.clwokki"

  zap trash: [
    "~/.config/clwokki",
    "~/.local/state/clwokki",
    "~/Library/Application Support/clwokki",
    "~/Library/LaunchAgents/com.wokkiapp.clwokki.plist",
    "~/Library/Logs/clwokki",
  ]

  caveats <<~EOS
    The clwokki daemon holds your connections and starts when a command needs it,
    through launchd, as clwokki (the microphone is asked for in its name).
    The menu bar app: open clwokki.app; its Launch at Login starts both at login.
    Updating: clwokki says when a newer one is out, with the command:
    brew upgrade --cask clwokki, then clwokki restart for a daemon that was running.
  EOS
end
