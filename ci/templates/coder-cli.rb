class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "{{VERSION}}"
  bottle :unneeded

  if OS.mac?
    url "{{MACOS_URL}}"
    sha256 "{{MACOS_SHA}}"
  else
    url "{{LINUX_URL}}"
    sha256 "{{LINUX_SHA}}"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
