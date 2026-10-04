class Localvault < Formula
  desc "Zero-infrastructure secrets manager with MCP server for AI agents"
  homepage "https://inventlist.com/tools/localvault"
  url "https://github.com/inventlist/localvault/archive/refs/tags/v1.15.1.tar.gz"
  sha256 "0868b2c80e8d399b9b59f9e2b0a31e8448eec01f9239d34b1f58fe9d6554018f"
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

    # Bin wrapper that sets up gem path and uses Homebrew ruby. It first saves
    # the caller's GEM_HOME/GEM_PATH so `localvault exec` can hand them back to
    # the child instead of leaking localvault's libexec gems into it.
    wrapper = <<~SH
      #!/bin/bash
      unset LOCALVAULT_ORIG_GEM_HOME LOCALVAULT_ORIG_GEM_PATH
      if [ -n "${GEM_HOME+x}" ]; then export LOCALVAULT_ORIG_GEM_HOME="$GEM_HOME"; fi
      if [ -n "${GEM_PATH+x}" ]; then export LOCALVAULT_ORIG_GEM_PATH="$GEM_PATH"; fi
      export LOCALVAULT_WRAPPED=1
      export GEM_HOME="#{libexec}/gems"
      export GEM_PATH="#{libexec}/gems"
      exec "#{ruby}" "#{libexec}/gems/bin/localvault" "$@"
    SH
    (bin/"localvault").write wrapper

    # Short alias — `localvault` stays the canonical binary
    (bin/"lv").write wrapper
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localvault version")
  end
end
