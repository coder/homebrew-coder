class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.17.4"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.4/coder-cli-darwin-amd64.zip"
    sha256 "d396747a310d5bd140d59c6080a38efbde5fa7fffb462062f3780dc7869a711a"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.4/coder-cli-linux-amd64.tar.gz"
    sha256 "1b14d08a97a4d6d1d3c408bfd3c1866b72d61abca08a2d856e4d3f7bd0892bef"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
