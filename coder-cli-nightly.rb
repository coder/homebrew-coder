class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.37.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.37.1/coder-cli-darwin-amd64.zip"
    sha256 "ca81635740f38bfc80f71918f5c5881ec598849e9f87709a519325b6e60b8614"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.37.1/coder-cli-linux-amd64.tar.gz"
    sha256 "9a612e656b9537f9329794908b5ab1ea1b89f5735982d99fb2c0dc7ebe22efeb"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
