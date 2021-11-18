class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.25.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.25.0/coder-cli-darwin-amd64.zip"
    sha256 "8ae65247c807278f61f9a5559cef5e3236367fde5627a1769a1f28c7140eadaa"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.25.0/coder-cli-linux-amd64.tar.gz"
    sha256 "6281e2695158521c74bbfa860d8b4fa039e34f05c84a0111a9fb2f2a1e1d8ea1"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
