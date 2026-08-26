# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.4"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.4/inventlist_Darwin_arm64.tar.gz"
      sha256 "7873adbb725b1d8d57dc9ab28a4a37c5a05b108d2227f0909b59bbb8953c719b"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.4/inventlist_Darwin_x86_64.tar.gz"
      sha256 "1a7836111b659c61bd6bfa87436d8e2e38b8e1ff785e7d571ad72a3a058e0d8c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.4/inventlist_Linux_arm64.tar.gz"
      sha256 "fe26c22acd9a7aa6e72b6ac228db2f070b666dc418abecb41e8de3cb2b7a46f6"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.4/inventlist_Linux_x86_64.tar.gz"
      sha256 "b4671516e174ad92240d6ce0b71c1b36054fd6a8b31c389deaa8a8da315f2dcf"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.4", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.4", shell_output("#{bin}/i version").strip
  end
end
