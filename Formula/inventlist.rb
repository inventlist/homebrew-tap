# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.58.1"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.58.1/inventlist_Darwin_arm64.tar.gz"
      sha256 "34d162d9a873239b86fd50beb2411aae83d4a7b5deb48ab244686a805f164ae7"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.58.1/inventlist_Darwin_x86_64.tar.gz"
      sha256 "78f332871180291f3746fa80c8041f00bcf8278dac9eeb7a8dbac072acc4005a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.58.1/inventlist_Linux_arm64.tar.gz"
      sha256 "0e9419c1f7b4ee8ef39497e36ddd9f4e833bc181902418c994c427b716f4829a"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.58.1/inventlist_Linux_x86_64.tar.gz"
      sha256 "025e17b357b446f3683f4298f9239cb37e4c5b0dcecb786e44520a61c2a3cb89"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.58.1", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.58.1", shell_output("#{bin}/i version").strip
  end
end
