class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.38.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.0/coder-cli-darwin-amd64.zip"
    sha256 "9bd9d99efeec36b7c0a0e3664516e6ff7f09774c5b7591f55a26d0afe948eefe"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.0/coder-cli-linux-amd64.tar.gz"
    sha256 "5b3f6368908a6890d0336a8e3bc5652d825466d5b469c8bf253f16e9dec53edc"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
