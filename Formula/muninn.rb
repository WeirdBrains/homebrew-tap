# Homebrew formula for Muninn (mnnn): installs prebuilt release binaries, no Rust needed.
# Published in the tap github.com/WeirdBrains/homebrew-tap as Formula/muninn.rb:
#   brew install weirdbrains/tap/muninn   (scripts/fill-sums.py fills in the sums)
class Muninn < Formula
  desc "Data goes in, your magic transforms it"
  homepage "https://github.com/WeirdBrains/muninn"
  version "2.28.0"
  license "BSD-3-Clause"

  base = "https://github.com/WeirdBrains/muninn/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7cf9e64fdb2ea7422a2ae1bdddfa63309d8462a820249e4e54bb6b18a2090c15"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "36b6e155f1ddc0bb84541a4187bcc9faf9fb081850fc9bf61e93c553f911fde4"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/muninn-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cf64685709ed7f07a64f0cb1cdd0bcbed071ddead969bf6731f4acde201ffc5"
    end
    on_intel do
      url "#{base}/muninn-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8f33add8f2bf433fbb4d1e8ce779b4aa62668153f387084b3b41b65c309e6d0"
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
