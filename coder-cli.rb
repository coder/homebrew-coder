class CoderCli < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/cdr/coder-cli"
  version "1.30.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.1/coder-cli-darwin-amd64.zip"
    sha256 "d21e5689d06c7056fea5d66e23ba15f520bcf142e782063e0a48da70d72bd8b8"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.30.1/coder-cli-linux-amd64.tar.gz"
    sha256 "a4da32e2d577ffbe14d957ea46b270eb94c0ccc55004d906ba99435628b18886"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
