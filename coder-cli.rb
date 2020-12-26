class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.14.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.1/coder-cli-darwin-amd64.zip"
    sha256 "42c40f50d7d990f1e4b2f5b93f9f7b11bdb84600cb983487afad1b03a6861cb5"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.1/coder-cli-linux-amd64.tar.gz"
    sha256 "5f1dc911560089b44fced4bfb4f2e0d0075ef9c49b805170e60ef6b56f43652e"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
