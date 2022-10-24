class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.34.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.2/coder-cli-darwin-amd64.zip"
    sha256 "f5941eb101efd7f6212a0c1aa254c43120b61b8a5d8a8eee39f3f4b9c031fa20"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.2/coder-cli-linux-amd64.tar.gz"
    sha256 "ddcaa7cace39346a9299ddecd84dfac3d395c88be691dde35cdc6a74dab46e04"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
