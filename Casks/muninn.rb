# Homebrew cask for Muninn.app (universal), from the release .dmg. Published in the tap
# github.com/WeirdBrains/homebrew-tap as Casks/muninn.rb:
#   brew install --cask weirdbrains/tap/muninn   (scripts/fill-sums.py fills in the sum)
cask "muninn" do
  version "2.22.0"
  sha256 "6e435f9687d3719f2fcc19c4f973504ef6d13a1b64995912afee0794c795b168"

  url "https://github.com/WeirdBrains/muninn/releases/download/v#{version}/muninn-#{version}-macos.dmg"
  name "Muninn"
  desc "Local, encrypted workbench for market data with peer-to-peer data workflows"
  homepage "https://muninn.weirdbrains.com"

  app "Muninn.app"
  binary "#{appdir}/Muninn.app/Contents/Resources/mnnn"

  caveats <<~EOS
    Muninn.app is not notarized. If macOS blocks it, right-click Muninn.app in
    /Applications and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/Muninn.app
  EOS
end
