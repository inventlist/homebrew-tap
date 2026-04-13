class Inventlist < Formula
  desc "InventList CLI — command your whole stack from the terminal"
  homepage "https://inventlist.com/tools/cli"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.2.0/inventlist_Darwin_arm64.tar.gz"
      sha256 "17b2595083265afe869b5641c32cc24059b70d6fe7edca86b9b9b9e026d67a11"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.2.0/inventlist_Darwin_x86_64.tar.gz"
      sha256 "0868c3983492ec41f0e38f500c6e06c6fd7d576d1ff1c3c01acd2c59c7332c65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.2.0/inventlist_Linux_arm64.tar.gz"
      sha256 "6f125f728506d58d0fbc9b19b57ced2ecb56400ac50e5bae8ddf217cab4937bc"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.2.0/inventlist_Linux_x86_64.tar.gz"
      sha256 "ea13d9d8920a6e0d6eed577726e9cf20d238d38f803b378199c5763f13fe7d0c"
    end
  end

  def install
    bin.install "inventlist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inventlist version")
  end
end
