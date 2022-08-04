class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.32.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.3/coder-cli-darwin-amd64.zip"
    sha256 "729a9e9da65139b296856b618b1ac93717ed4f823f9d85cc88b75173ff5dee47"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.3/coder-cli-linux-amd64.tar.gz"
    sha256 "2682ff7c5ad53dfab5fcd5068c8b40282115567062f27b36f35e1ded5c94b9b7"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
