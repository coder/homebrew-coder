class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.18.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.18.1/coder-cli-darwin-amd64.zip"
    sha256 "ab682b4138a0f6f0dcf20fa7044e0f89ff54c9a861503e158288ddd87e8b4dbf"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.18.1/coder-cli-linux-amd64.tar.gz"
    sha256 "04046d90fe9f0d3f549e17e67bec65913df70ee8766cc81174293bf53759e66d"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
