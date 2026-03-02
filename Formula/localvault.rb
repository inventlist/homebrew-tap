class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://github.com/inventlist/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "00623eee52ab2b0984d2b457428e1ad09c2aba553106226c4dbff2a180dc3bf0"
  license "MIT"

  depends_on "libsodium"

  uses_from_macos "ruby", since: :catalina

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", "thor", "-v", "~> 1.3", "--no-document"
    system "gem", "install", "rbnacl", "-v", "~> 7.1", "--no-document"
    system "gem", "install", "base64", "--no-document"

    libexec.install Dir["lib/**/*"]
    libexec.install "bin/localvault"

    (bin/"localvault").write <<~SH
      #!/bin/bash
      export GEM_HOME="#{libexec}"
      export GEM_PATH="#{libexec}"
      exec ruby -I "#{libexec}" "#{libexec}/localvault" "$@"
    SH
  end

  test do
    assert_match "localvault #{version}", shell_output("#{bin}/localvault version")
  end
end
