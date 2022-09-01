class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.30.5"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.5/coder-cli-darwin-amd64.zip"
    sha256 "18acdccfbb37cd6c3675903a0594eaa056636cbab6ac2821b5c45ef43a16475d"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.5/coder-cli-linux-amd64.tar.gz"
    sha256 "773b3f7ac77f59bc59c1938389baeedc577ebdb2f3ad7c0c0d7344459fcffac5"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
