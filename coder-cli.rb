class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.2/coder-cli-darwin-amd64.zip"
    sha256 "89054d4c64e7ec066e34612a2e95660ceb29397a5b92e02e94f784268f95d391"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.2/coder-cli-linux-amd64.tar.gz"
    sha256 "490eea5fd2841fe101494841d8f2239328d6bc50fe857fcfa2dae902bd114837"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
