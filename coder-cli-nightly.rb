class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.36.2"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.36.2/coder-cli-darwin-amd64.zip"
    sha256 "c8867a7227b40da3a909171e5011a4f0cd26b010e24a629807e17e164713ae65"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.36.2/coder-cli-linux-amd64.tar.gz"
    sha256 "ee9ab184c6acaeca2a2a75d9cc59087828462d09bdd3ee87e8ac30b9bc8a51de"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
