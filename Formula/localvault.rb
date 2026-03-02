class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://github.com/inventlist/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "56e8307d1521fae3b6c41dde78379f2389a4df9721e1775583d970f2b28e2164"
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
