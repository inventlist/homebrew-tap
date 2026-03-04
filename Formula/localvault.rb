class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://inventlist.com/tools/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "9af06c85609601244c70b7cb844f9bcefe3c65d381f5c1f31c68b7906a0a6388"
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
    system gem, "install", "rbnacl", "-v", "~> 7.1", "--no-document",
           "--", "--with-sodium-dir=#{Formula["libsodium"].opt_prefix}"
    system gem, "install", "base64", "--no-document"

    # Copy lib and bin into libexec
    (libexec/"lib").install Dir["lib/*"]
    (libexec/"bin").install "bin/localvault"
    chmod 0755, libexec/"bin/localvault"

    # Wrapper that sets GEM paths and uses Homebrew Ruby
    (bin/"localvault").write <<~SH
      #!/bin/bash
      export GEM_HOME="#{libexec}/gems"
      export GEM_PATH="#{libexec}/gems"
      exec "#{ruby}" -I "#{libexec}/lib" "#{libexec}/bin/localvault" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localvault version")
  end
end
