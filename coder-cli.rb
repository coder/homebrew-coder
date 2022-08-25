class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.32.4"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.4/coder-cli-darwin-amd64.zip"
    sha256 "8eb040f70be1330d57d7a17e5dd9c1ecf1fbb22a3460d9fae0eacbedb1b2fd97"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.32.4/coder-cli-linux-amd64.tar.gz"
    sha256 "2ab5eb5b482a4c50c750d89b46285cc7ef9c47ac765b0c2adb9498218af0ec4f"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
