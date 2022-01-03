class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.26.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.26.0/coder-cli-darwin-amd64.zip"
    sha256 "beeb48513e9583d70b4f5003f19d0595b05e53b96f8188e2f3afc028ae5a3a44"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.26.0/coder-cli-linux-amd64.tar.gz"
    sha256 "76d3bd5906a2142ae0666fc50bd0e8d0677212623432bf4832423de71ff2dfcd"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
