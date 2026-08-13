# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.2"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.2/inventlist_Darwin_arm64.tar.gz"
      sha256 "bd247a4aa2ffd009acbac9221809568bb3239bd00cc0b180998fded9fbef6545"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.2/inventlist_Darwin_x86_64.tar.gz"
      sha256 "cb6800eabd4fde041a6bbbb8d100591599ec9002e82ab0935e1a5904ac8cfecd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.2/inventlist_Linux_arm64.tar.gz"
      sha256 "cf9209cb929b8d3c74eff270138e866c994062d73b357b85205bc269a559af23"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.2/inventlist_Linux_x86_64.tar.gz"
      sha256 "f3379711b03d1f181d4188d5bd11509620b793ba7baac03c1d1ed5365c7aaf11"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.2", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.2", shell_output("#{bin}/i version").strip
  end
end
