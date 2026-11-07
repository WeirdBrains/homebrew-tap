# Homebrew formula for Muninn (mnnn): installs prebuilt release binaries, no Rust needed.
# Published in the tap github.com/WeirdBrains/homebrew-tap as Formula/muninn.rb:
#   brew install weirdbrains/tap/muninn   (scripts/fill-sums.py fills in the sums)
class Muninn < Formula
  desc "Local, encrypted workbench for market data with peer-to-peer data workflows"
  homepage "https://github.com/WeirdBrains/muninn"
  version "2.22.0"
  license "BSD-3-Clause"

  base = "https://github.com/WeirdBrains/muninn/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ca6d74bcfad16a788819cc9312debbb013c6c610fa26923e4ef2302ced711835"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "738123c2d7c1ed5f054297b1ff694c27c8a1742edd0d5d9952c90dde57cb49d3"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d7f8c188d8c5634aa5e7f507205203e22072809aa110f4a37f08529ac7ecc32"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a9b5632f5583e5f6a4660c00d9732560b8bc9d27a47166d9b38b459ae7d7d21"
    end
  end

  def install
    bin.install "mnnn"
    man1.install Dir["man/*.1"]
    doc.install "README.md", "CHANGELOG.md", "docs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mnnn --version")
    assert_match "Install", shell_output("#{bin}/mnnn help install")
  end
end
