class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.39.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.39.0/coder-cli-darwin-amd64.zip"
    sha256 "74c3685384dc16cee77e4a6503d2f97d24d73ea61e1b12a5b53fcb307592c57a"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.39.0/coder-cli-linux-amd64.tar.gz"
    sha256 "c9d04ba28715bc480de970077a4712165f79be054ddfe79406e1afcce1d16f35"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
