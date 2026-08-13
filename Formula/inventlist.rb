# typed: strict
# frozen_string_literal: true

class Inventlist < Formula
  desc "Command-line tools for publishing and operating projects"
  homepage "https://inventlist.com"
  version "0.59.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.0/inventlist_Darwin_arm64.tar.gz"
      sha256 "eca3ddadeb975890ae921c4494ca21800a722f5d4377161e1380a7d9a8e87c19"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.0/inventlist_Darwin_x86_64.tar.gz"
      sha256 "2abce4ac88ace075c2a1d44e0acd47062463e9e4a556035ba730ca09e99c1c3a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.0/inventlist_Linux_arm64.tar.gz"
      sha256 "19abbb09710aadfb4473e45eb218d076c03b0411742bb256f91cec680cef9269"
    end
    on_intel do
      url "https://github.com/inventlist/cli-releases/releases/download/v0.59.0/inventlist_Linux_x86_64.tar.gz"
      sha256 "0263e2fb554ad793ed4f0946ed35f573377d72bb6b8880a4d9529bfaf9b1ee75"
    end
  end

  def install
    bin.install "inventlist"
    bin.install "i"
  end

  test do
    assert_equal "inventlist v0.59.0", shell_output("#{bin}/inventlist version").strip
    assert_equal "inventlist v0.59.0", shell_output("#{bin}/i version").strip
  end
end
