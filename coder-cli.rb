class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.31.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.1/coder-cli-darwin-amd64.zip"
    sha256 "e68681988bdd46edd85c03289e36f29189433537036e70b4c44477fd971a3e47"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.31.1/coder-cli-linux-amd64.tar.gz"
    sha256 "169f2f0aafad816c8c76c95161e3c230184af52d0ae41006ce771e3a88637bf4"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
