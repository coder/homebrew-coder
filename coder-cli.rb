class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.28.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.28.0/coder-cli-darwin-amd64.zip"
    sha256 "92a3cfdc04f3fb2e8223b6d1e8daffd310ec71f7725a2774ea23fe5f9eaa0b27"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.28.0/coder-cli-linux-amd64.tar.gz"
    sha256 "01172df70f9f43ebf4d8e0e810471bdbb6bcad96e75d1797224075ae9f813295"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
