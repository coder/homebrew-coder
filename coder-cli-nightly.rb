class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.18.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.18.0/coder-cli-darwin-amd64.zip"
    sha256 "2238737433eb68355cc98f221d6a03bf68c8ba72b275010e20b4bdc26333e916"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.18.0/coder-cli-linux-amd64.tar.gz"
    sha256 "681ba472793828cba6ae827a9493af24a0a6479b64e503d558283b5d5c214997"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
