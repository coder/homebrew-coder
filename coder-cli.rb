class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.14.2+cli.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.2%2Bc1.1/coder-cli-darwin-amd64.zip"
    sha256 "41e475a2b228f5d646c488d537093eb444b235088e0e4c3f70ef47b5db0cb81d"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.14.2%2Bc1.1/coder-cli-linux-amd64.tar.gz"
    sha256 "b0b99aa3872ef4b5e79187c8e9095e8c262766ee9b18f84790a0f5d5cfc78142"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
