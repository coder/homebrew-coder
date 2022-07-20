class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.30.4"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.4/coder-cli-darwin-amd64.zip"
    sha256 "7cc0a7bd1a7b63bdcc75ef11461170178e3d814772ac15ef11a8ee0942c09433"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.4/coder-cli-linux-amd64.tar.gz"
    sha256 "26c4349baa5de0d1ad6e9b476ad5ed11d634deef1966f3f2baec550ceb87c27b"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
