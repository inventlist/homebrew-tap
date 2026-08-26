# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.5"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.5/inventlist_Darwin_arm64.tar.gz"
      sha256 "8d13a559cd7f4c5ffd091061dc31a27d2b7135adb8eb564b3fa9be8a857ba742"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.5/inventlist_Darwin_x86_64.tar.gz"
      sha256 "85dece11e2babfc4e0d3e5e1a6b2d6055116a3f156a0fbbc1089ce7086a96513"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.5/inventlist_Linux_arm64.tar.gz"
      sha256 "392a6a78bf68a7426b854efa4f28b5082d29f5245965a851166797db0be0d504"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.5/inventlist_Linux_x86_64.tar.gz"
      sha256 "90dd1d47051bd3cfa335e1b968b47c42f51c5881bd9d77bed3bbf135b6a350b0"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.5", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.5", shell_output("#{bin}/i version").strip
  end
end
