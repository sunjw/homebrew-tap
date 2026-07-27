cask "fhash" do
  version "26.7.46"

  # GitHub release universal DMG
  url "https://github.com/sunjw/fhash/releases/download/#{version}/fHash-#{version}-macOS.dmg"
  name "fHash"
  desc "An open source files hash calculator for macOS."
  homepage "https://github.com/sunjw/fhash"

  # fHash-26.7.46-macOS.dmg
  sha256 "115051D5DC94B4DA1B0867F7AFC71274C966E65B2501D092A261E7ACF1CEFC20"

  livecheck do
    url :url
    strategy :github_latest_release
  end

  app "fHash.app"

  zap trash: [
    "~/Library/Containers/org.sunjw.fHashMacUI",
  ]

  # fHash unsigned
  caveats <<~EOS
    fHash is unsigned and not notarized. On the first launch, macOS Gatekeeper will block it.
    To open: System Settings → Privacy & Security → scroll to the bottom → click "Open Anyway".
  EOS
end
