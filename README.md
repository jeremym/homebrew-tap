# jeremym/homebrew-tap

Homebrew cask for [ClipySecure](https://github.com/jeremym/clipy-secure), a privacy-first clipboard manager with encrypted history.

## Install

```bash
brew install --cask jeremym/tap/clipy-secure
open -a ClipySecure
```

## Signing

ClipySecure is signed with the project's own self-signed certificate, not an
Apple Developer ID, and is **not notarized**. The cask removes the
`com.apple.quarantine` flag on install so the app launches without a
Gatekeeper prompt.

## Verifying a release

```bash
shasum -a 256 ClipySecure-1.0.0.zip              # matches the release .sha256
codesign -d -r- /Applications/ClipySecure.app    # check the leaf hash below
```

A genuine build prints:

```
certificate leaf = H"a3ed032a6666d06c91d1c35147ad0e44093c1b5e"
```
