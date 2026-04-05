class Inventlist < Formula
  desc "InventList CLI — command your whole stack from the terminal"
  homepage "https://inventlist.com/tools/cli"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.1.0/inventlist_Darwin_arm64.tar.gz"
      sha256 "fbafd9709168fb5f2d2d5e3743f8ece4be37b4703724eeea8c070099b2e33583"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.1.0/inventlist_Darwin_x86_64.tar.gz"
      sha256 "3e729929ac7e5610ae28684147e42a154c5448daca2d572d67c247b2765af342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.1.0/inventlist_Linux_arm64.tar.gz"
      sha256 "292a8aa20bc614ce481984fb1cab10fe695a2d9d1e3a6b7d819b641b6508fe9b"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.1.0/inventlist_Linux_x86_64.tar.gz"
      sha256 "ab52c30ab3ced6c75ed398d84f936355e43e73a63071527b6d1cd3a3917fade5"
    end
  end

  def install
    bin.install "inventlist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inventlist version")
  end
end
