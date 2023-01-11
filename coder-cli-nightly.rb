class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.38.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.2/coder-cli-darwin-amd64.zip"
    sha256 "3277ab7919b3628ec81ddcd7cd9decc71752d40112fa6ba59275c1a5c6718b20"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.2/coder-cli-linux-amd64.tar.gz"
    sha256 "566193303eec2d2650e61de4bee9078bac4db8cdda98345bcc1ee0293da660b4"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
