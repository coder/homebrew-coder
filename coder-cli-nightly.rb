class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.31.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.3/coder-cli-darwin-amd64.zip"
    sha256 "55c6924606867ab31dc676fbb47e8d3977702e77ad9aa29e38ed02ca4c31f506"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.3/coder-cli-linux-amd64.tar.gz"
    sha256 "a517bc98c5d53e69e2feae74d3c04297645e10e4a9b94b082ef63fe6e64ed452"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
