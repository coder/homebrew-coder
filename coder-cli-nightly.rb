class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.22.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.21.0/coder-cli-darwin-amd64.zip"
    sha256 "6eb8479316c68bc2e3e6a90c3ca1b06c0307299a051b70f6222926e34d527e02"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.21.0/coder-cli-linux-amd64.tar.gz"
    sha256 "e39f6162e2c10ccb135975e19972df804e0fca4a1684d336956fcaaa5866b15b"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
