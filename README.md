# dardevelin's Homebrew tap

The tools I make, in one tap:

```sh
brew tap dardevelin/tap
```

Then install any of them by name, or skip the tap step and use the full name.

| Tool | What it is | Install |
|------|------------|---------|
| [clwokki](https://github.com/dardevelin/clwokki-releases) | Voice and chat on Mumble servers from the terminal, a status bar and the Mac's menu bar | macOS: `brew install --cask dardevelin/tap/clwokki`<br>Linux: `brew install dardevelin/tap/clwokki` |
| [gensystray](https://github.com/dardevelin/gensystray) | A system tray icon configured with a config file | `brew install --cask dardevelin/tap/gensystray` |
| [domain-probe](https://github.com/dardevelin/domain-probe) | Fast, thorough domain intelligence from the terminal | `brew install dardevelin/tap/domain-probe` |

Upgrading: `brew upgrade`, or one tool, for example `brew upgrade --cask clwokki`.

## clwokki

- **macOS 27 or later**: the cask installs `/Applications/clwokki.app`
  (Developer ID signed and notarized) and the `clwokki` command.
- **Linux** (glibc 2.35 or later), x86_64 or aarch64, with Homebrew on
  Linux: the formula. `brew services start clwokki` keeps its daemon running.

clwokki looks for a newer release once a day, and when its terminal UI or
menu bar opens. When one is out, it tells you the command to run
(`brew upgrade --cask clwokki`, or `brew upgrade clwokki` on Linux). Then
`clwokki restart` puts a running daemon on the new version. Releases, and
what's new in each, are on
[dardevelin/clwokki-releases](https://github.com/dardevelin/clwokki-releases/releases).

Installed clwokki from `dardevelin/wokki`, its first tap? It moved here:
`brew trust --cask dardevelin/tap/clwokki`, then `brew update`.
