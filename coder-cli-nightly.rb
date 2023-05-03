class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.42.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.42.1/coder-cli-darwin-amd64.zip"
    sha256 "34f0b4f163ae2ceab53bc7656ddc574a55f6397b7a369048af699443b6b0755b"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.42.1/coder-cli-linux-amd64.tar.gz"
    sha256 "725266c68120a89f03665707b9ebe1a49b9e962471b6dd01a60b8814378423ce"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
