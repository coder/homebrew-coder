class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.20.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.20.0/coder-cli-darwin-amd64.zip"
    sha256 "3616f940a21ba6f912541e377c36dd689f0a303ec91e171119c99f73db12aba1"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.20.0/coder-cli-linux-amd64.tar.gz"
    sha256 "57c0d412c6fd5da513b0965670454d940728268b1cec7793d5db74d9a28e3efd"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
