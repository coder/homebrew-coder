class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.16.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.16.0/coder-cli-darwin-amd64.zip"
    sha256 "e2ae636f51245356992206c3e08f72fd6e937e1b17be804b82598a9dc2f0dee2"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.16.0/coder-cli-linux-amd64.tar.gz"
    sha256 "ae7c7af5c9dae2de2bfa24689c3d8afeecc95fa97eefc47ce7c324efeaabb724"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
