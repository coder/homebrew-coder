class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.35.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.1/coder-cli-darwin-amd64.zip"
    sha256 "b82685ac371ab2b0dc37b69fdaac89191021993642cdc7e3541aa6aa3a8298c1"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.1/coder-cli-linux-amd64.tar.gz"
    sha256 "c53d8786c2b5806fe802a424f04b691c52ae9e44330b85fb8aa168e117bb9614"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
