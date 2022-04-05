class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.1/coder-cli-darwin-amd64.zip"
    sha256 "339995a8b41634c7d0ec58c20e6add3f4304423dee5fd7dfdd175856f9839412"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.1/coder-cli-linux-amd64.tar.gz"
    sha256 "fbb44c2c1f2887cc4c315bcb65f65fb78e859c96f155a32e426b11ae4d549ede"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
