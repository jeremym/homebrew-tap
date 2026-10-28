# Homebrew cask for jeremym/homebrew-tap (Casks/speech-hub.rb).
# scripts/update-tap.sh rewrites the `version` and `sha256` lines; keep their shape.
cask "speech-hub" do
  version "0.1.0"
  sha256 "891c90598e856db1bfbee48317ea6b3691e9a2e62ff4dca37691e1d86c779981"

  url "https://github.com/jeremym/speech-hub/releases/download/v#{version}/SpeechHub-#{version}.zip"
  name "Speech Hub"
  desc "Local AI text-to-speech that any app, script or Shortcut can speak through"
  homepage "https://github.com/jeremym/speech-hub"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Speech Hub.app"
  # The CLI lives inside the bundle; this puts `speak` on PATH without the in-app installer.
  binary "#{appdir}/Speech Hub.app/Contents/MacOS/speak"

  # Not notarized (no Apple Developer ID, by choice). Drop the quarantine flag Homebrew sets so
  # first launch isn't blocked. Integrity: the sha256 above + the certificate leaf hash in the
  # release notes (codesign -d -r- "/Applications/Speech Hub.app").
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Speech Hub.app"], must_succeed: false
  end

  uninstall launchctl: "com.jeremym.speechhub",
            quit:      "com.jeremym.speechhub"

  zap trash: [
    "~/Library/Application Support/com.jeremym.speechhub",
    "~/Library/Caches/com.jeremym.speechhub",
    "~/Library/LaunchAgents/com.jeremym.speechhub.plist",
    "~/Library/Logs/Speech Hub",
    "~/Library/Preferences/com.jeremym.speechhub.plist",
    "~/Library/WebKit/com.jeremym.speechhub",
  ]

  caveats <<~EOS
    Speech Hub is signed with the project's own certificate, not an Apple Developer ID,
    and is not notarized. The quarantine flag is removed on install so it launches
    without a Gatekeeper prompt.

    Grant Accessibility when asked so Option+Escape can read selected text.
    Try:  echo "hello" | speak
  EOS
end
