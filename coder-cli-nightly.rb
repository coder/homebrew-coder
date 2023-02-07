class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.39.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.39.1/coder-cli-darwin-amd64.zip"
    sha256 "74cf000a932b932dd025bd3da52f382916d45c5b5a0b143ef05ab6db10dcba16"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.39.1/coder-cli-linux-amd64.tar.gz"
    sha256 "fc08fe979f0d57a6215f2c8397e3868c7bff2b159817c2d29f511b013f2ded1a"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
