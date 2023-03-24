class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.41.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.41.0/coder-cli-darwin-amd64.zip"
    sha256 "53ddb662775de449b9c1c1045450bdba7b2b5a03a62aac270b0c969fd3fa9dde"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.41.0/coder-cli-linux-amd64.tar.gz"
    sha256 "318aeb208eee9a69eff3c155fb2c7b8b0c0b7ee6f2d7ffacd51082af5980b895"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
