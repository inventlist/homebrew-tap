class Inventlist < Formula
  desc "InventList CLI — command your whole stack from the terminal"
  homepage "https://inventlist.com/tools/cli"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.2.1/inventlist_Darwin_arm64.tar.gz"
      sha256 "fac957e2c112494e71ef48481de0bc1d78f3c65442b3bf0172954aed85089ef9"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.2.1/inventlist_Darwin_x86_64.tar.gz"
      sha256 "b304967f17c00dde8e408bcd5a661d6ab3b335671eb2f24dd5e7a0ab35d7224c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inventlist/cli/releases/download/v0.2.1/inventlist_Linux_arm64.tar.gz"
      sha256 "57f8da754ac575daaeccef52cdebfb455b1a3a78fa223451af410fb4560de013"
    end
    on_intel do
      url "https://github.com/inventlist/cli/releases/download/v0.2.1/inventlist_Linux_x86_64.tar.gz"
      sha256 "48bce57ea76aa3f81d7e9478169b4aaf9c22ee27f5fea56c93a7a2988be189ab"
    end
  end

  def install
    bin.install "inventlist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inventlist version")
  end
end
