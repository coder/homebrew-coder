class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.19.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.19.0/coder-cli-darwin-amd64.zip"
    sha256 "a24ea0db0c16d1b1b1a91e38ccd1792092633214b3c5094de1b4d5829d14c893"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.19.0/coder-cli-linux-amd64.tar.gz"
    sha256 "294302d9a76175d0c037000be10648f50c8bf8e51d2723a580642a61bc2abdc3"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
