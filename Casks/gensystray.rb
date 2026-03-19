cask "gensystray" do
  version "2.2.0"
  sha256 "077f49e19245c169d9947eeedbbf3d8f2255c6c2c92860cae9cc636cfeadb25b"

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
