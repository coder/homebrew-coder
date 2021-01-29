class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.16.0-rc.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.16.0-rc.0/coder-cli-darwin-amd64.zip"
    sha256 "7552b45f956c2a027c58beb0867d6df32d75291a0a5b6ad0c6bc9957306da989"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.16.0-rc.0/coder-cli-linux-amd64.tar.gz"
    sha256 "038ebbb4e338c2b308857691a1e6119a2419b68abfa9f95f9787db886703e0bc"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
