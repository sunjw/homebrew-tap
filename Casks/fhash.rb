cask "fhash" do
  version "26.9.50"
  sha256 "C5B2EF8D7452B8E963788F007C3F59E00F968446633BFBC6984DDD1DBF2F7FE5"
  url "https://github.com/sunjw/fhash/releases/download/#{version}/fHash-#{version}-macOS.dmg"
  name "fHash"
  desc "An open source files hash calculator for macOS."
  homepage "https://github.com/sunjw/fhash"

  depends_on macos: :sonoma

  livecheck do
    url "https://github.com/sunjw/fhash/releases"
    strategy :github_latest_release
  end

  app "fHash.app"

  zap trash: [
    "~/Library/Containers/org.sunjw.fHashMacUI"
  ]

  caveats <<~EOS
    fHash is unsigned and not notarized. On the first run, the Gatekeeper will block the app.
    To open it, go to System Settings → Privacy & Security, scroll to the bottom, and click Open Anyway for fHash.
    Or, run xattr -dr com.apple.quarantine /Applications/fHash.app in Terminal to remove the Gatekeeper quarantine attribute.
    Use these workarounds at your own risk.
  EOS
end
