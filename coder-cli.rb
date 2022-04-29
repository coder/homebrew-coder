class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.29.4"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.4/coder-cli-darwin-amd64.zip"
    sha256 "5e1b28a4bd56a02b9b1c196885dc0ee58e48921eeffb65b08112c8098cc1d7cf"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.29.4/coder-cli-linux-amd64.tar.gz"
    sha256 "e82b127b0901b1feef4b7ef17c38adb3a77b18c363d044f74d62d6b6274abb2f"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
