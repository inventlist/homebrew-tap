class Inventlist < Formula
  desc "InventList CLI — command your whole stack from the terminal"
  homepage "https://inventlist.com/tools/cli"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.2.2/inventlist_Darwin_arm64.tar.gz"
      sha256 "effa70f95e5b187db04d114c839a091e1b6d804c9b0c0123bc27621c06bc476c"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.2.2/inventlist_Darwin_x86_64.tar.gz"
      sha256 "ef5a5716abdf39249c1b247531fcd63795a6cb9e35de2e5c5e288f2176f73488"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.2.2/inventlist_Linux_arm64.tar.gz"
      sha256 "5f893fbde863cd68f6ad49a6a06b9ff3a65016cb31cbcdf61953484aac8b8aad"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.2.2/inventlist_Linux_x86_64.tar.gz"
      sha256 "7321b26b8184344d13c61362f9046286c3ce29bb234ebd164c4e9dcc326c21b4"
    end
  end

  def install
    bin.install "inventlist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inventlist version")
  end
end
