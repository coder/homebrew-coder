class Coder < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.14.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.2/coder-cli-darwin-amd64.zip"
    sha256 "69b69497a75ce19851681974aa7561af7c7061357f8616e24446e58795bf6e1f"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.2/coder-cli-linux-amd64.tar.gz"
    sha256 "a670d99bea86a621eddebb41247cf0b699a2273bc5f0accfe3411c1253c16141"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
