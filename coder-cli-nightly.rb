class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.35.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.2/coder-cli-darwin-amd64.zip"
    sha256 "98b81063b5e2c74134b54befb9c79340401f879871e8583e3258d8a83e041ebf"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.2/coder-cli-linux-amd64.tar.gz"
    sha256 "acf6de5f22f0d8e1a9ca9079fc13f94d02a157e26888cb95697556bc2105b618"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
