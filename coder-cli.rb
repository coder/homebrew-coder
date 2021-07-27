class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.21.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.21.0/coder-cli-darwin-amd64.zip"
    sha256 "357baf20341293d6f2e1bd8e7632d67de4eb2ca1e8bfa57efaa540d5713ccf7e"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.21.0/coder-cli-linux-amd64.tar.gz"
    sha256 "324fa1b21bcf494d4662ab20d42611e70b604ed14085560e76226bab549bf373"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
