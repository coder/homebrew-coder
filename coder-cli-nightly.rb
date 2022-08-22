class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.3/coder-cli-darwin-amd64.zip"
    sha256 "23133f1cccd2a6ca6e683ed45a5d281ffbfc786c5bb8f799606c0cc251395ea8"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.3/coder-cli-linux-amd64.tar.gz"
    sha256 "676dd8c35b0da68ab57e903be509ee62feed65965dce6157bc7dcd5ee64953b4"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
