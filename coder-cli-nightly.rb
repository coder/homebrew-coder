class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.0/coder-cli-darwin-amd64.zip"
    sha256 "483e7363c44e1f81331c3631100f8f562a276534919aff937b8dbe6d29657814"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.0/coder-cli-linux-amd64.tar.gz"
    sha256 "de068821b284a0b491fc5b1b349425256f1a0b85d6362c599555a508e3dba9ad"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
