class CoderAT1 < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/coder/coder-v1-cli"
  version "1.44.3"

  if OS.mac?
    url "https://github.com/coder/coder-v1-cli/releases/download/v#{version}/coder-cli-darwin-amd64.zip"
    sha256 "d195a77055aa4e41d86c5060b458ffbdeccd7a728f813fec232dd1173c8a54cd"
  else
    url "https://github.com/coder/coder-v1-cli/releases/download/v#{version}/coder-cli-linux-amd64.tar.gz"
    sha256 "3699b65b045aa248dc270c4462477f9f2e6504a349fd0f45e4a2b47b5d6c6faa"
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
