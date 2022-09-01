class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.34.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.0/coder-cli-darwin-amd64.zip"
    sha256 "0f3f3a4366687a1d56bffe4403882a3cc83f8f0042b802ee6bb9167ac700aca1"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.34.0/coder-cli-linux-amd64.tar.gz"
    sha256 "f3b7bb292d1c6a8478b8167ebc4eded91c43c444996acec337b8c6a11e912ce9"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
