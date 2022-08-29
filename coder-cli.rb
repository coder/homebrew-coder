class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.4"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.4/coder-cli-darwin-amd64.zip"
    sha256 "02af1c6ce453a5681d716cbb9446315d4239b084929fd6a1a50930f377654502"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.4/coder-cli-linux-amd64.tar.gz"
    sha256 "09f545bb8f6409fe9d5eaf3c45b5e3e58920e283dae3ca7c00401c7aa3c9c5fe"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
