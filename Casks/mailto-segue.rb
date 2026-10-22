cask "mailto-segue" do
  version "0.0.1"
  sha256 "f022f61793055a3df025be39409de74bdbfd391b582999d01de9fc6a47128cd2"

  url "https://github.com/jeremym/mailto-segue/releases/download/v#{version}/MailtoSegue-#{version}.zip"
  name "Mailto Segue"
  desc "Route mailto: links and .eml replies to the right account, browser and app"
  homepage "https://github.com/jeremym/mailto-segue"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "Mailto Segue.app"
  binary "#{appdir}/Mailto Segue.app/Contents/Helpers/segue"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mailto Segue.app"], must_succeed: false
  end

  uninstall quit: "com.overtonefoundry.segue"

  zap trash: "~/Library/Application Support/Mailto Segue"

  caveats <<~EOS
    Mailto Segue is signed with the project's own certificate, not an Apple Developer
    ID, and is not notarized. The quarantine flag is removed on install so it
    launches without a Gatekeeper prompt.

    Open it once and click "Make Mailto Segue default". Before `brew uninstall`,
    click "Restore Mail as default" (or run `segue restore-default`) so macOS
    doesn't keep pointing mailto: at a missing app.
  EOS
end
