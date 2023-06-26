class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.43.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.43.1/coder-cli-darwin-amd64.zip"
    sha256 "0861bfc89e8625ea11707633f4762cfed6422372199c838ad6d13cf13de11d30"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.43.1/coder-cli-linux-amd64.tar.gz"
    sha256 "a13fac9a0ad4fc3a5fa79dfc95bdb191c2745d9b155fdf7845834ea48109aa99"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
