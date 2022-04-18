class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.2/coder-cli-darwin-amd64.zip"
    sha256 "1215692df4444386abf0ef7258b495abbd5b70b480bc97724cd8808c3e568314"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.2/coder-cli-linux-amd64.tar.gz"
    sha256 "a9251da9aae7d3cc5a2a5928c6797dffb5bdda50151cc03d267db1a2b83c36f4"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
