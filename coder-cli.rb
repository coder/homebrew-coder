class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.3/coder-cli-darwin-amd64.zip"
    sha256 "0f3e386facfb0e803c0bc2996b3ae0dd9b1cf610653ff82c1a489d0075735016"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.3/coder-cli-linux-amd64.tar.gz"
    sha256 "de82df145ead9f96cc0885292aa5654dc92c9dd4a789b480c1fd4585bb3fa26a"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
