class Coder < Formula
  desc "A command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  url "https://github.com/cdr/coder-cli/releases/download/v1.14.2/coder-cli-darwin-amd64.zip"
  version "v1.14.2"
  sha256 "ddf256cfa77bc19775e9490d088ba1c74bd8197f08c51dfdf79c5f7c3f49fdf6  /Users/charlie/coder/coder-cli/ci/bin/coder-cli-linux-amd64.tar.gz"
  bottle :unneeded
  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
