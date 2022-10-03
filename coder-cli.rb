class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.34.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.1/coder-cli-darwin-amd64.zip"
    sha256 "634297b5f7a355a00b550a72e369301c3a508e510bb08c405b7aa3f932b6d16d"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.1/coder-cli-linux-amd64.tar.gz"
    sha256 "7d2bf56760228ed2d2da57d2d7cf9c9681ffe9c988908536b363dae5f3c4154c"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
