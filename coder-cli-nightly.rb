class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.27.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.27.0/coder-cli-darwin-amd64.zip"
    sha256 "13a17e97de04c4207920b1830e2aea9e8f8f0a4f0a8362c91fc35d5d218246e8"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.27.0/coder-cli-linux-amd64.tar.gz"
    sha256 "1c79598e5dd29f0ba724a77d482389dfa629825905254ab31d7fc349bbd8076b"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
