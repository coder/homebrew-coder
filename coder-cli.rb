class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.35.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.0/coder-cli-darwin-amd64.zip"
    sha256 "cdac40b1c2a5b56d0836b77024983cbdc4891f1935fb72d2ee212d3a120303e8"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.0/coder-cli-linux-amd64.tar.gz"
    sha256 "7e605f3419ffeea84837a639e272ac5004e55a04433f04f9608f6337b8ed56ff"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
