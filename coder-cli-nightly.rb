class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.17.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.2/coder-cli-darwin-amd64.zip"
    sha256 "e69d7ef1fdfac58f6592772e9cced574289a8747e885ee6d45137c0da707571d"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.2/coder-cli-linux-amd64.tar.gz"
    sha256 "40a390d532e5889212b6a2477f0f1da9ebc93b1d092842c57b7a6c32d582b1e8"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
