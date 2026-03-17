class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://inventlist.com/tools/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "6baa35caf36719d7c71eeeeaa2ec49eed41c6fcf6bc76640165106b542ff889a"
  license "MIT"

  depends_on "libsodium"
  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec/"gems"
    ENV["GEM_PATH"] = libexec/"gems"

    ruby = Formula["ruby"].opt_bin/"ruby"
    gem = Formula["ruby"].opt_bin/"gem"

    # Install the gem and all its dependencies in one step — gemspec is the
    # single source of truth for runtime deps, so this can never drift.
    system gem, "build", "localvault.gemspec"
    system gem, "install", "--no-document", "--install-dir", libexec/"gems",
           "--", "--with-sodium-dir=#{Formula["libsodium"].opt_prefix}",
           Dir["localvault-*.gem"].first

    # Create bin wrapper that sets up gem path and uses Homebrew ruby
    (bin/"localvault").write <<~SH
      #!/bin/bash
      export GEM_HOME="#{libexec}/gems"
      export GEM_PATH="#{libexec}/gems"
      exec "#{ruby}" "#{libexec}/gems/bin/localvault" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localvault version")
  end
end
