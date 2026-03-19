class Gensystray < Formula
  desc "Generic system tray icon configured via a config file"
  homepage "https://github.com/dardevelin/gensystray"
  version "2.2.0"

  on_macos do
    url "https://github.com/dardevelin/gensystray/releases/download/v2.2.0/GenSysTray-2.2.0-macos.zip"
    sha256 "077f49e19245c169d9947eeedbbf3d8f2255c6c2c92860cae9cc636cfeadb25b"
  end

  def install
    bin.install "GenSysTray.app/Contents/MacOS/gensystray"
    prefix.install "GenSysTray.app"
  end

  def caveats
    <<~EOS
      GenSysTray.app has been installed to:
        #{opt_prefix}/GenSysTray.app

      To use as a menu bar app (no Dock icon):
        open #{opt_prefix}/GenSysTray.app

      Config file location:
        ~/.config/gensystray/gensystray.cfg

      Override config path:
        GENSYSTRAY_PATH=/path/to/config.cfg open #{opt_prefix}/GenSysTray.app
    EOS
  end

  test do
    system "#{bin}/gensystray", "--version"
  end
end
