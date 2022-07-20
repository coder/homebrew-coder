class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.32.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.2/coder-cli-darwin-amd64.zip"
    sha256 "23cf0daea7af10701d969fd0b6e1d19b9a228335a8dcc13b6701f8bc94b7b99a"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.2/coder-cli-linux-amd64.tar.gz"
    sha256 "3a9464884e007fb423768b0b90daa050c2fa7de1122c9ba72f3cc8ca5bf91865"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
