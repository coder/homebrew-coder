class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.14.2+cli.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.2%2Bcli.1/coder-cli-darwin-amd64.zip"
    sha256 "f92a067dea9f1ae5c219406ddb01aca65e68d6087ac84594729726134ffe6d62"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.2%2Bcli.1/coder-cli-linux-amd64.tar.gz"
    sha256 "038ebbb4e338c2b308857691a1e6119a2419b68abfa9f95f9787db886703e0bc"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
