class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.31.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.2/coder-cli-darwin-amd64.zip"
    sha256 "ab9273cf21399856f12b7856fc918619d54aeaaeb177bbedee3ef400ab4db517"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.2/coder-cli-linux-amd64.tar.gz"
    sha256 "1311791ddec5246b2ccfef9ed01658a854b8199a27a03654dc1321ff81ee5c85"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
