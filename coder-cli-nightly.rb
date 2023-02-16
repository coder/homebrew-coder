class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.39.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.39.2/coder-cli-darwin-amd64.zip"
    sha256 "911b39262951cc2a6fed59716073522b7fb06c27c99704f32ba9fbdd9aa08271"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.39.2/coder-cli-linux-amd64.tar.gz"
    sha256 "9aa8faa832af303e5ccacb743113d584b22ea570dc4f660d51f833f0c8805153"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
