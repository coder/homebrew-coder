class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.40.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.40.0/coder-cli-darwin-amd64.zip"
    sha256 "68d3299325234382143ee4f1f614bd676ab01b4c8dd430cb38b3703f5d546057"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.40.0/coder-cli-linux-amd64.tar.gz"
    sha256 "56782ca3af6c466c3ca9e8f6b9eec2a4b6e133bf7c225962c6845681f2500be9"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
