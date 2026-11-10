class GrokbotTui < Formula
  desc "Terminal UI for Grok Bot"
  homepage "https://weirdbrains.github.io/grokbot-tui/"
  version "1.41.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/WeirdBrains/grokbot-tui/releases/download/v1.41.6/grokbot-tui-aarch64-apple-darwin.tar.xz"
      sha256 "278e1aceb98a83b943c11482ba5f7bdd14b33787edfbcdb23835ea8e9e4fdad2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/WeirdBrains/grokbot-tui/releases/download/v1.41.6/grokbot-tui-x86_64-apple-darwin.tar.xz"
      sha256 "8cfc0eac0667ebc0a94f1b57555b2d6e60ef2a940f9dd0d25a3267eec7ff10d1"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/WeirdBrains/grokbot-tui/releases/download/v1.41.6/grokbot-tui-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "79ef03f60366bdcf656f628eaeef8acaf37bba6d56202e63c7a022411e5dc944"
    end
    if Hardware::CPU.intel?
      url "https://github.com/WeirdBrains/grokbot-tui/releases/download/v1.41.6/grokbot-tui-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4f935b4a53db13408e43930a936e3b220bfdb19651c8f28723b6c520513c42c1"
    end
  end
  license "GPL-3.0-or-later"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "grokbot-tui"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "grokbot-tui"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "grokbot-tui"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "grokbot-tui"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
