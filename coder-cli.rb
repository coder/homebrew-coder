class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.32.5"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.5/coder-cli-darwin-amd64.zip"
    sha256 "f0d6a3b90bf49909f38adcb80b5f5afe3236cef6158d36db07c1f3348ad3df0e"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.5/coder-cli-linux-amd64.tar.gz"
    sha256 "439ce5f3243e6af666f6230612beb42c0ff1baeda4d874eae6af512d17ef11f7"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
