class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://inventlist.com/tools/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v1.9.1.tar.gz"
  sha256 "b483a825a3c2f52c67f378eeebd8be4a60ec06079282c849a123241b02cbf044"
  license "Apache-2.0"

  depends_on "libsodium"
  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec/"gems"
    ENV["GEM_PATH"] = libexec/"gems"

    ruby = Formula["ruby"].opt_bin/"ruby"
    gem = Formula["ruby"].opt_bin/"gem"

    # Build the gem from source — gemspec is the single source of truth
    system gem, "build", "localvault.gemspec"

    # Install the built gem + all runtime deps into GEM_HOME
    system gem, "install", "--no-document", "localvault-#{version}.gem"

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
