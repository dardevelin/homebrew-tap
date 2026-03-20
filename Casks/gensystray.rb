cask "gensystray" do
  version "2.6.0"
  sha256 "c0785ca2152260df76e5f6312dd884a87c465532011cd676243177faf8985782"

  url "https://github.com/dardevelin/gensystray/releases/download/v#{version}/GenSysTray-#{version}-macos.zip"
  name "GenSysTray"
  desc "Generic system tray icon configured via a config file"
  homepage "https://github.com/dardevelin/gensystray"

  app "GenSysTray.app"

  caveats <<~EOS
    Config file location:
      ~/.config/gensystray/gensystray.cfg

    Override config path:
      GENSYSTRAY_PATH=/path/to/config.cfg open /Applications/GenSysTray.app

    To run a specific instance:
      open /Applications/GenSysTray.app --args --instance <name>
  EOS
end
