class Clwokki < Formula
  desc "Voice and chat on Mumble servers from the terminal"
  homepage "https://github.com/dardevelin/clwokki-releases"
  version "0.25.1"
  license :cannot_represent

  depends_on :linux

  # Linux only (a Mac takes the cask): each architecture's archive.
  on_linux do
    on_intel do
      url "https://github.com/dardevelin/clwokki-releases/releases/download/clwokki-v0.25.1/clwokki-0.25.1-linux-x86_64.tar.gz"
      sha256 "cb8dff953535fe8bc57401d0f0d984f0da57891a231496ac11d0f3d918325e3a"
    end
    on_arm do
      url "https://github.com/dardevelin/clwokki-releases/releases/download/clwokki-v0.25.1/clwokki-0.25.1-linux-aarch64.tar.gz"
      sha256 "6700582659a7eeb995b59bd4cccc184df75597d5c4e0008ba01162ddaab3f96b"
    end
  end

  def install
    # The binary finds its sound packs beside it.
    libexec.install "clwokki", "WokkiKit_WokkiSounds.bundle"
    bin.install_symlink libexec/"clwokki"
    pkgshare.install "clwokki.service", "README.md", "LICENSES.md"
  end

  def caveats
    <<~EOS
      The clwokki daemon holds your connections; any clwokki command starts it.
      To keep it running as a user service: brew services start clwokki
      Updating: clwokki says when a newer one is out, with the command:
      brew upgrade clwokki, then clwokki restart (or brew services restart clwokki).
      Sound needs libpulse (PulseAudio or PipeWire's pulse), the keyring libsecret:
      clwokki doctor says what this machine has.
    EOS
  end

  service do
    run [opt_bin/"clwokki", "daemon"]
    keep_alive crashed: true
    log_path var/"log/clwokki.log"
    error_log_path var/"log/clwokki.log"
  end

  test do
    assert_match "clwokki #{version}", shell_output("#{bin}/clwokki --version")
  end
end
