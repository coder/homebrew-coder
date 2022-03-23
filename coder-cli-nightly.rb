class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.0/coder-cli-darwin-amd64.zip"
    sha256 "3fd36422fcba1bc9a24d4a5ee59a55f0306c824571b3facc23796bb8064f3e92"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.0/coder-cli-linux-amd64.tar.gz"
    sha256 "82332075200a7aa4b8921a0f9384a416c2eb462aa568e59ae7ef344b03e3569a"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
