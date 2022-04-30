class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.30.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.2/coder-cli-darwin-amd64.zip"
    sha256 "738430961e4e5f3e5f1fc8a80f8a5901fbbbf75df7aa881dd02fbb8598364593"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.2/coder-cli-linux-amd64.tar.gz"
    sha256 "893d5f80afcc1934ee72fe9c4f450173254f9eae3e6e53b56af83db107eb5864"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
