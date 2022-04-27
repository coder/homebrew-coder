class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.30.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.0/coder-cli-darwin-amd64.zip"
    sha256 "0782a775bc6c7ac9df9a58ddb466eedcf5fa05593eabde72251591dc1ac5c8f1"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.0/coder-cli-linux-amd64.tar.gz"
    sha256 "ac5c8d624007c8206cc9aea9d485327f2fe1b7b685168e7b962a55100c084255"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
