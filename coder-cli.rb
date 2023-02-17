class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.38.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.3/coder-cli-darwin-amd64.zip"
    sha256 "95a6e8d53daea00f3c10161ae7da9bd118840eaa3493be531f2bec404afde40c"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.3/coder-cli-linux-amd64.tar.gz"
    sha256 "e5c75190c3ae0c996da0dffd807f751b6096f3c7d2942507ad2019eda201d356"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
