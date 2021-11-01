class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.24.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.24.0/coder-cli-darwin-amd64.zip"
    sha256 "90b4c473932ed0442e6d6e9a27514b01d5f34018453bebcaf0547ca6cf276a3d"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.24.0/coder-cli-linux-amd64.tar.gz"
    sha256 "b36654d3936af0e3fb3d2d21ddbed95eb4e09703951129fe8e53ee0db89dfdea"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
