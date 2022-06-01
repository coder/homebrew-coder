class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.30.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.3/coder-cli-darwin-amd64.zip"
    sha256 "d88858086cb1d345e0eb53913176820864bbc5867c90dcf808d0b56cb539e4c8"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.3/coder-cli-linux-amd64.tar.gz"
    sha256 "f1db24483b2e1281d66b0409e46437ecf59ac3b8a916bf056da3c52225974184"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
