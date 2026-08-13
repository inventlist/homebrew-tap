# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.1"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.1/inventlist_Darwin_arm64.tar.gz"
      sha256 "51c0136019140cc9d766b48758cb72dcc097bbcf60a18cca5d08268b85405ac8"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.1/inventlist_Darwin_x86_64.tar.gz"
      sha256 "3a2a2d3448474d31c0180bd3d9630abaa39530e6e061fa8b98e6c82482475efa"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.1/inventlist_Linux_arm64.tar.gz"
      sha256 "347dea3d2d067f07b7fc17f811106d633704914b6e855b50953e7a678fd87519"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.1/inventlist_Linux_x86_64.tar.gz"
      sha256 "dab12d7dc52dbe2ac0fc3076ed038bd933954cdc52f082ee184a0028da10ed95"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.1", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.1", shell_output("#{bin}/i version").strip
  end
end
