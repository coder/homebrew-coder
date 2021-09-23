class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.23.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.23.0/coder-cli-darwin-amd64.zip"
    sha256 "ff25c8fe376a316fbf6db32ac39c45faa9b8c9b5d77292715de00dacbe665002"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.23.0/coder-cli-linux-amd64.tar.gz"
    sha256 "00d9df7d275aa1e027ebe8cbb267eb4df1ad33d761b1f9ac1f9fb1a79604ee4c"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
