class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.37.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.37.0/coder-cli-darwin-amd64.zip"
    sha256 "f96409043b1a4ae3d9848975a8f93e2a67f2379c5b7a7f7978c9d38d31109649"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.37.0/coder-cli-linux-amd64.tar.gz"
    sha256 "fdace0f838e58bc1a323e85114712479c33984d2581f6e0fe445f8d057cb5853"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
