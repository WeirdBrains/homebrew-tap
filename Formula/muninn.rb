# Homebrew formula for Muninn (mnnn): installs prebuilt release binaries, no Rust needed.
# Published in the tap github.com/WeirdBrains/homebrew-tap as Formula/muninn.rb:
#   brew install weirdbrains/tap/muninn   (scripts/fill-sums.py fills in the sums)
class Muninn < Formula
  desc "Local, encrypted store for OHLCV market bars"
  homepage "https://github.com/WeirdBrains/muninn"
  version "2.20.1"
  license "BSD-3-Clause"

  base = "https://github.com/WeirdBrains/muninn/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8ee9cfbd3dd47c8a69a6545f02f038fa55e96ea2f84e39bba65df2da382606ed"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "176433a12b322b060170c53ce2c91da58805543554df76422fdeb4813be7a570"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "017e165d5d28dfaff5f9846dff39a39accc48f62cafff0b37fcc3def7829fbf8"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "530cd213c6b31961a5c1717a8a4b463d8e60f5f6aa7a840546f1e7af0d5ca9a6"
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
