class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.31.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.0/coder-cli-darwin-amd64.zip"
    sha256 "e1ecbdffbf5e3f75516be667a62833f2180106a56f93ec4c814d83b448719ca7"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.0/coder-cli-linux-amd64.tar.gz"
    sha256 "03c699cba064546e553382e34b667ad292b6cfe2443c4115a9890ff7ebda48a9"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
