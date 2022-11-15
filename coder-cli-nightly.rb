class CoderCliNightly < Formula
  desc "Command-line tool for the Coder remote development platform, nightly release channel"
  homepage "https://github.com/cdr/coder-cli"
  version "1.35.3"

  if OS.mac?
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.3/coder-cli-darwin-amd64.zip"
    sha256 "2a02de35184fe745cffabb11c3083586bb216c01ed86796318c6af500386a89e"
  else
    url "https://github.com/cdr/coder-cli/releases/download/v1.35.3/coder-cli-linux-amd64.tar.gz"
    sha256 "abdbddc9b03596d2834430772c1fd8b1f369768ead072c70c9e4b43ece85a1ec"
  end

  def install
    bin.install "coder"
  end
  test do
    system "#{bin}/coder", "--version"
  end
end
