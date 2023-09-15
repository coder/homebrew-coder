class CoderAT1 < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/coder/coder-v1-cli"
  version "1.44.1"

  if OS.mac?
    url "https://github.com/coder/coder-v1-cli/releases/download/v#{version}/coder-cli-darwin-amd64.zip"
    sha256 "3975294c3063316353fa368d9b066a9ec419b055663d4e8ab9c2d1bb7612698d"
  else
    url "https://github.com/coder/coder-v1-cli/releases/download/v#{version}/coder-cli-linux-amd64.tar.gz"
    sha256 "18dbe03aaab24c714a7c63de60273ed5472bdf4559e82fd36c0b6e277790a042"
  end

  keg_only :versioned_formula

  def version_suffix
    version.major.to_s
  end

  def install
    bin.install "coder"
  end

  test do
    system "#{bin}/coder", "--version"
  end
end
