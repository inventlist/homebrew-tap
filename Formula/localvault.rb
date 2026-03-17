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
    ENV["SODIUM_LIB_DIR"] = Formula["libsodium"].opt_lib.to_s
    ENV["SODIUM_INCLUDE_DIR"] = Formula["libsodium"].opt_include.to_s

    ruby = Formula["ruby"].opt_bin/"ruby"
    gem = Formula["ruby"].opt_bin/"gem"

    # Build the gem from source — gemspec is the single source of truth
    system gem, "build", "localvault.gemspec"

    # Install the built gem + all runtime deps
    gem_file = Dir["localvault-#{version}.gem"].first || Dir["localvault-*.gem"].first
    system gem, "install", "--no-document", gem_file

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
