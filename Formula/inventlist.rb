# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.6"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.6/inventlist_Darwin_arm64.tar.gz"
      sha256 "c2a2f13c43c954d1a37249788776216162312b9b698c5b851b55911c8745a834"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.6/inventlist_Darwin_x86_64.tar.gz"
      sha256 "b9807efa1e57bab8a8303f7ca6456dd10fc95b2079640ca161e6b3d8df592af2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.6/inventlist_Linux_arm64.tar.gz"
      sha256 "ff760603d45be0ad7fae9c2169030cf705c762f1129d5b8c84e97f8d36a1a1fc"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.6/inventlist_Linux_x86_64.tar.gz"
      sha256 "69f5ac9d3f6cffb3672fc38a42b779fb4f7d4d52ab41fd6d0655f5ef2b6baff8"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.6", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.6", shell_output("#{bin}/i version").strip
  end
end
