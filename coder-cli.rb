class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.34.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.3/coder-cli-darwin-amd64.zip"
    sha256 "33cac399c7998dde63c1b725d2818973be31c645f72b09e1087d8fe6b1df6fbd"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.3/coder-cli-linux-amd64.tar.gz"
    sha256 "2a82bf19006e648cbf42f60bda58cc592c293b3b4833384256b3213d8f0040e0"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
