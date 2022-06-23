class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.32.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.0/coder-cli-darwin-amd64.zip"
    sha256 "9755ef9f48493475f0c01eb6dbe71e39f6cb35f2e603b0ad9e25395e8aaef9bb"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.0/coder-cli-linux-amd64.tar.gz"
    sha256 "b4618f7cc6b4e983fe2880ee1221340fe81cc0b019c4fdcbf78f636f8bdb1913"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
