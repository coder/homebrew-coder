class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.32.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.1/coder-cli-darwin-amd64.zip"
    sha256 "775d9317d027c3577e25a22eeb2185d0bd281e9b4a89c83ce950415e57a63dff"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.1/coder-cli-linux-amd64.tar.gz"
    sha256 "a0f17b7db829221042ef609a6ec09680857b43a6ff35771838f82d5b7c869086"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
