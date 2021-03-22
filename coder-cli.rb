class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.17.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.0/coder-cli-darwin-amd64.zip"
    sha256 "1639f99cf86982da71550000f7d7fcf5563492c92855602907b67484a5e1420a"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.0/coder-cli-linux-amd64.tar.gz"
    sha256 "3cee0a07315cf642ea26a7a09d211048af5255d571427e95d5e07b69cd80b0cf"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
