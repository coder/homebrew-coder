class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.17.0-rc.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.0-rc.1/coder-cli-darwin-amd64.zip"
    sha256 "efc6c6d7527c3f410c16402532daf0019035c5fb14d957134cdeb2904a29838f"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.17.0-rc.1/coder-cli-linux-amd64.tar.gz"
    sha256 "e69ea0ead0ed0499f4b74a99849277887e545b9ff413708d708b5a67a6bbd72e"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
