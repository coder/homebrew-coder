class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.41.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.41.1/coder-cli-darwin-amd64.zip"
    sha256 "ca6a18a8027357ac9fd22fdcca6af7bf2c0de56406b4f66fc82788e428e767ce"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.41.1/coder-cli-linux-amd64.tar.gz"
    sha256 "9a916a068bb4e5ad32f164ed9fc7159987dc01e4f6803552542418ffad958f92"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
