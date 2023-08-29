class CoderAT1 < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/coder/coder-v1-cli"
  version "1.44.0"

  if OS.mac?
    url "https://github.com/coder/coder-v1-cli/releases/download/v1.44.0/coder-cli-darwin-amd64.zip"
    sha256 "f3fe13cec4d0615a40134675279d4cd1a5a871356d90dedef020981622f1b693" # mac
  else
    url "https://github.com/coder/coder-v1-cli/releases/download/v1.44.0/coder-cli-linux-amd64.tar.gz"
    sha256 "642320e709a8585ae732e3b31d5945a09cd2a7d63121d7121c34ebc5740d3fc9" # linux
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end