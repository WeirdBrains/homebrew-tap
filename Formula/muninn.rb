# Homebrew formula for Muninn (mnnn): installs prebuilt release binaries, no Rust needed.
# Published in the tap github.com/WeirdBrains/homebrew-tap as Formula/muninn.rb:
#   brew install weirdbrains/tap/muninn   (scripts/fill-sums.py fills in the sums)
class Muninn < Formula
  desc "Local, encrypted store for OHLCV market bars"
  homepage "https://github.com/WeirdBrains/muninn"
  version "2.20.0"
  license "BSD-3-Clause"

  base = "https://github.com/WeirdBrains/muninn/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "af4d432df47a19c2a57a26e15c45c731d4fbede9ebcf23ef353788f8b689c49a"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c9c6b603978a948ef8188c5a1a0de64dfc07a7de0e866ca2db1d4dde0328b086"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35fd8ec247474a66871db545dd141aede1ead596b5d22975488a8ce02481e887"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d65c81f0a04f0c5e0eb703c776b27ac5a54ca838c127ed1a0daf652a6e65ef43"
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
