class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.15.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.15.0/coder-cli-darwin-amd64.zip"
    sha256 "b3f2ac2f34818dbabc2789dc8b558c612bfc2da8afe62d2c7f197ff32ae8e9cf"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.15.0/coder-cli-linux-amd64.tar.gz"
    sha256 "79db911672dd52426deafeea1b2360beaaeec5e5f6bb3fe1574c1ed9798655f5"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
