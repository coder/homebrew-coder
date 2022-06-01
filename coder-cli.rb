class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.6"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.6/coder-cli-darwin-amd64.zip"
    sha256 "a05270ae4f84676aec0963b3286904094656f1bbd401d5c16f534214d4e339cd"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.6/coder-cli-linux-amd64.tar.gz"
    sha256 "c0580c5d119f2f720c387b4a5ae6937d4f2ea648391cfa33b4eab68f39e62afa"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
