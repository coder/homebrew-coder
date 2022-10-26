class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.36.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.36.0/coder-cli-darwin-amd64.zip"
    sha256 "99d394ddb21c1af4b58d6c025a36d42a442bde2bb9ec915ee8d5b457b0d669db"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.36.0/coder-cli-linux-amd64.tar.gz"
    sha256 "43c1125fd8018b2ca4835e82cc4475614e1c1f41d0722ccc5553c93815616738"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
