class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.43.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.43.0/coder-cli-darwin-amd64.zip"
    sha256 "0fd665c5073ea50ff9e9e3b3ee0ef607b3055d3e5942cb2ddf31e8f2fa9a8cdd"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.43.0/coder-cli-linux-amd64.tar.gz"
    sha256 "1373ce4a474565c2dd87e0c0474c823a2ba48bc03a0b15392e5a8ec138306f75"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
