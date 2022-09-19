class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.5"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.5/coder-cli-darwin-amd64.zip"
    sha256 "e4d1f385c9f071b89b42d016d4d409fd72655bb14f738249b242fa0f54937fb3"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.5/coder-cli-linux-amd64.tar.gz"
    sha256 "6a61a6e3df54074b39adcbd11a1e6f711afff238500b3f0d820a86a7a83e7fa9"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
