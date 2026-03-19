cask "gensystray" do
  version "2.2.1"
  sha256 "5264ffa4e2fc8bf128921683cb56d72a7e23b1ff1ced753ba4b440fa46fe0154"

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
