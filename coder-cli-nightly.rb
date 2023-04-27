class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.42.0"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.42.0/coder-cli-darwin-amd64.zip"
    sha256 "358c43a6157d999f1c8ecb8e745f1852ce315fb250ca7b3e41a6046ef1d86c70"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.42.0/coder-cli-linux-amd64.tar.gz"
    sha256 "d6e181b3e4a189ef1398f469a7a4ccf41960003e014f5bc6024c5c0efb0842b4"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
