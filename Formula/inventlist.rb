class Inventlist < Formula
  desc "InventList CLI — command your whole stack from the terminal"
  homepage "https://inventlist.com/tools/cli"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.1.9/inventlist_Darwin_arm64.tar.gz"
      sha256 "65bbe598ae1b0d338b34ed4ac64a03a657254cae11a84aca7b39e111a035278b"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.1.9/inventlist_Darwin_x86_64.tar.gz"
      sha256 "04a0a4a4da0636184d3da5bee60775da282445ab73bd7cb0984b843f1921b30d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.1.9/inventlist_Linux_arm64.tar.gz"
      sha256 "66bd60dc85fa9b771b536fb50e6025e3ab077883b5d5f0e2537a6d152d5589c1"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.1.9/inventlist_Linux_x86_64.tar.gz"
      sha256 "5b9e8345cf5dbab83137f214b0d8cdf371024082b7cada36e4d731bc7924cb52"
    end
  end

  def install
    bin.install "inventlist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inventlist version")
  end
end
