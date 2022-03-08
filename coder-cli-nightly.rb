class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.28.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.28.2/coder-cli-darwin-amd64.zip"
    sha256 "b0fbf3486d63892ffe718f12b6b418c49eecebdd34a9c713b53c1cf81385dd57"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.28.2/coder-cli-linux-amd64.tar.gz"
    sha256 "a3472dc7968affcbd9bf03fd14304eff365c0dad5d8ed732bd98744a2de880f6"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
