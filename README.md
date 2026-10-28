# jeremym/homebrew-tap

Homebrew casks for Jeremy's macOS apps.

| Cask | App | Install |
| --- | --- | --- |
| `clipy-secure` | [ClipySecure](https://github.com/jeremym/clipy-secure), a privacy-first clipboard manager with encrypted history | `brew install --cask jeremym/tap/clipy-secure` |
| `stillroom` | [Stillroom](https://github.com/jeremym/stillroom), a goal-first, local-first AI workflow studio over Ollama | `brew install --cask jeremym/tap/stillroom` |

## ClipySecure

```bash
brew install --cask jeremym/tap/clipy-secure
open -a ClipySecure
```

### Signing

ClipySecure is signed with the project's own self-signed certificate, not an
Apple Developer ID, and is **not notarized**. The cask removes the
`com.apple.quarantine` flag on install so the app launches without a
Gatekeeper prompt.

### Verifying a release

```bash
shasum -a 256 ClipySecure-1.0.0.zip              # matches the release .sha256
codesign -d -r- /Applications/ClipySecure.app    # check the leaf hash below
```

A genuine build prints:

```
certificate leaf = H"a3ed032a6666d06c91d1c35147ad0e44093c1b5e"
```

## Stillroom

```bash
brew install --cask jeremym/tap/stillroom
open -a Stillroom
```

Apple silicon only, macOS 13 (Ventura) or newer. Stillroom runs models through
[Ollama](https://ollama.com) on your Mac, so have it running with a chat model;
the cask does not install Ollama for you. Your recipes, runs and results live in
`~/Library/Application Support/com.jeremym.stillroom`, and any API key you add is
kept in your login keychain under the service `com.jeremym.stillroom`.
`brew uninstall` leaves both in place; `brew uninstall --zap` removes the data
directory but never touches the keychain.

### Signing

Stillroom is signed with the project's own self-signed "Stillroom Release"
certificate, not an Apple Developer ID, and is **not notarized**. The cask
removes the `com.apple.quarantine` flag on install so the app launches without a
Gatekeeper prompt.

### Verifying a release

```bash
shasum -a 256 Stillroom-0.1.0.zip                # matches the release .sha256
codesign -d -r- /Applications/Stillroom.app      # check the leaf hash below
```

A genuine build prints:

```
designated => identifier "com.jeremym.stillroom" and certificate leaf = H"32ace20bdc543323908a451fea68106e9225a6b9"
```
