class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.6"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.6/coder-cli-darwin-amd64.zip"
    sha256 "f934f23f6d4aad1d50ac09a5b3307bee418ad96704e8957e27a193dfe151cafe"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.6/coder-cli-linux-amd64.tar.gz"
    sha256 "a4c029d8e5b7d818b56b62d5eb29446ac8f848787baeeb759a43a9f8aebc191c"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
