class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.35.4"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.4/coder-cli-darwin-amd64.zip"
    sha256 "b432e3743c4ca2c80e023798aa62d81be92844a4b97536ee199c277e64887550"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.4/coder-cli-linux-amd64.tar.gz"
    sha256 "0c969f683a1dd6f40c2901053e17f1112eb801f7fe973acae2c00646179caeca"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
