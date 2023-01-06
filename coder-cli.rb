class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.38.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.1/coder-cli-darwin-amd64.zip"
    sha256 "766fb6c0a1659786624c58f46093cfba5999c36cfec6ebaf4e8075da44b7334a"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.38.1/coder-cli-linux-amd64.tar.gz"
    sha256 "7d86916ea0357a85738d8a7ae62398bd9a75665977940313625508a0e77ec10f"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
