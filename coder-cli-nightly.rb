class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.33.1"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.1/coder-cli-darwin-amd64.zip"
    sha256 "251325e4201244176f15e20097410dc59a561c5eefbde0fee8d398c583cc0139"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.33.1/coder-cli-linux-amd64.tar.gz"
    sha256 "188a645510df5bef459b37fb9ba354ed6ff74189c755eb186e117136c48406a0"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
