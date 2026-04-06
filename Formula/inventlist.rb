class Inventlist < Formula
  desc "InventList CLI — command your whole stack from the terminal"
  homepage "https://inventlist.com/tools/cli"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.1.1/inventlist_Darwin_arm64.tar.gz"
      sha256 "e0fe04ac1cb3e98c6adf85de88478009ee0af4c8837c14c161ef68033d85e285"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.1.1/inventlist_Darwin_x86_64.tar.gz"
      sha256 "c1d1fbc6866a9a91153bea024e43ce80a0c8dd7ea833ca17bc46a76f5fa581fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.1.1/inventlist_Linux_arm64.tar.gz"
      sha256 "3372040f2f59461ed0a8384029abb48a55e0f38a9368e6b6ff5c578f35f09a49"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.1.1/inventlist_Linux_x86_64.tar.gz"
      sha256 "2b7567257c1b45d3d657f86d3c2d909386c6c52bb714fd9843a6a063a4f5afcb"
    end
  end

  def install
    bin.install "inventlist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inventlist version")
  end
end
