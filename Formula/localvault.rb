class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://inventlist.com/tools/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v1.14.0.tar.gz"
  sha256 "7e2c039e505f134f4060d02dcda1fa94155e31396a07ec514b03454bd10909d3"
  license "Apache-2.0"

  depends_on "libsodium"
  depends_on "ruby"

  conflicts_with "lv", because: "both install an `lv` binary"

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

    # Short alias — `localvault` stays the canonical binary
    (bin/"lv").write <<~SH
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
