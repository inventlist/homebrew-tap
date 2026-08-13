# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.3"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.3/inventlist_Darwin_arm64.tar.gz"
      sha256 "d9862687664d536a0bd42b6674e3c0614f3f479ce8cd3956e53866617e66ba5e"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.3/inventlist_Darwin_x86_64.tar.gz"
      sha256 "152f88a9100bcce19819b087a63ee9baec37d23fb93d0ba4042148c79a0421ae"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.3/inventlist_Linux_arm64.tar.gz"
      sha256 "0f0ae2adb27bfc518b49fb0d36bc45b897d0669c3b19fbcdd981af78ac30a403"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.3/inventlist_Linux_x86_64.tar.gz"
      sha256 "88c509bb1ed30c054acc24d6d47e1593c9a8e01faac1b39597f8a69f6d645041"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.3", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.3", shell_output("#{bin}/i version").strip
  end
end
