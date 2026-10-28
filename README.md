# jeremym/homebrew-tap

Homebrew casks for Jeremy's macOS apps. Every app here is signed with its
project's own self-signed certificate, not an Apple Developer ID, and is **not
notarized**. Each cask removes the `com.apple.quarantine` flag on install so the
app launches without a Gatekeeper prompt. Integrity rests on the release sha256
and the certificate leaf hash listed under each app.

| Cask | App | Install |
| --- | --- | --- |
| `clipy-secure` | [ClipySecure](https://github.com/jeremym/clipy-secure), a privacy-first clipboard manager with encrypted history | `brew install --cask jeremym/tap/clipy-secure` |
| `mailto-segue` | [Mailto Segue](https://github.com/jeremym/mailto-segue), routes mailto: links and .eml replies to the right account, browser and app | `brew install --cask jeremym/tap/mailto-segue` |
| `speech-hub` | [Speech Hub](https://github.com/jeremym/speech-hub), local AI text-to-speech that any app, script or Shortcut can speak through | `brew install --cask jeremym/tap/speech-hub` |
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

## Mailto Segue

```bash
brew install --cask jeremym/tap/mailto-segue
open -a "Mailto Segue"
```

macOS 14 (Sonoma) or newer, universal binary (Apple silicon and Intel). The
cask also links the `segue` CLI onto your PATH. Open the app once and click
"Make Mailto Segue default". Before `brew uninstall`, click "Restore Mail as
default" (or run `segue restore-default`) so macOS does not keep pointing
mailto: links at a missing app. Settings live in
`~/Library/Application Support/Mailto Segue`; `brew uninstall` leaves them,
`brew uninstall --zap` removes them.

### Signing

Mailto Segue is signed with the project's own self-signed "Segue Release"
certificate, not an Apple Developer ID, and is **not notarized**. The cask
removes the `com.apple.quarantine` flag on install so the app launches without a
Gatekeeper prompt.

### Verifying a release

```bash
shasum -a 256 MailtoSegue-0.0.1.zip                 # matches the release .sha256
codesign -d -r- "/Applications/Mailto Segue.app"    # check the leaf hash below
```

A genuine build prints:

```
designated => identifier "com.overtonefoundry.segue" and certificate leaf = H"272ab5c5fcc895597698dcd78c2056c06704b0c7"
```

## Speech Hub

```bash
brew install --cask jeremym/tap/speech-hub
open -a "Speech Hub"
echo "hello" | speak
```

Apple silicon only, macOS 13 (Ventura) or newer. The cask also links the
`speak` CLI onto your PATH. Grant Accessibility when asked so Option+Escape
can read the selected text aloud. Voices, settings and the hub socket live in
`~/Library/Application Support/com.jeremym.speechhub`; `brew uninstall` leaves
them, `brew uninstall --zap` removes them.

### Signing

Speech Hub is signed with the project's own self-signed "Speech Hub Release"
certificate, not an Apple Developer ID, and is **not notarized**. The cask
removes the `com.apple.quarantine` flag on install so the app launches without a
Gatekeeper prompt.

### Verifying a release

```bash
shasum -a 256 SpeechHub-0.1.0.zip                   # matches the release .sha256
codesign -d -r- "/Applications/Speech Hub.app"      # check the leaf hash below
```

A genuine build prints:

```
designated => identifier "com.jeremym.speechhub" and certificate leaf = H"b6025fb03507222832dcb4303acaa4ac194fbd67"
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
