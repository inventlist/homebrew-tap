class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://inventlist.com/tools/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c77df088101a19dd929953018b8faaff5a23b6f5d62cc949d483aaa82c1d7624"
  license "MIT"

  depends_on "libsodium"
  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec/"gems"
    ENV["GEM_PATH"] = libexec/"gems"

    # Use Homebrew ruby, not system ruby
    ruby = Formula["ruby"].opt_bin/"ruby"
    gem = Formula["ruby"].opt_bin/"gem"

    system gem, "install", "thor", "-v", "~> 1.3", "--no-document"
    system gem, "install", "rbnacl", "-v", "~> 7.1", "--no-document"
    system gem, "install", "base64", "--no-document"

    # Install lib and bin into libexec
    (libexec/"lib").install Dir["lib/*"]
    libexec.install "bin/localvault"
    chmod 0755, libexec/"localvault"

    # Create bin wrapper that sets up gem path and uses Homebrew ruby
    (bin/"localvault").write <<~SH
      #!/bin/bash
      export GEM_HOME="#{libexec}/gems"
      export GEM_PATH="#{libexec}/gems"
      exec "#{ruby}" -I "#{libexec}/lib" "#{libexec}/localvault" "$@"
    SH
  end

  test do
    assert_match "localvault #{version}", shell_output("#{bin}/localvault version")
  end
end
