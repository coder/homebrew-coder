class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.36.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.36.1/coder-cli-darwin-amd64.zip"
    sha256 "c1defa031fc4ffa05e624d3eec3401393cacb62cc4f0abe5fa040cab2cc09d6b"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.36.1/coder-cli-linux-amd64.tar.gz"
    sha256 "dc78cc6a41c939411c098ca539f25d5002ef328ed9ad6b69089f9d1baf793128"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
