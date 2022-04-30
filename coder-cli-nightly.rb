class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.5"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.5/coder-cli-darwin-amd64.zip"
    sha256 "3925083b6bae8f527f6e691fea5be6c707a32f5cbaf4fe8602784908f1de1afc"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.5/coder-cli-linux-amd64.tar.gz"
    sha256 "78552b5ed3abed35b238b840ee347a44b1d6ae8528f015966bd01ac3080a19a3"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
