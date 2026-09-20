class CoderAT1 < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/coder/coder-v1-cli"

  if OS.mac?
    url "https://github.com/coder/coder-v1-cli/releases/download/v1.44.6/coder-cli-darwin-amd64.zip"
    sha256 "25f1520691adc672c8b0d2acd102a9d73c27ac6a7c935d7f45a88b982bbce772"
  else
    url "https://github.com/coder/coder-v1-cli/releases/download/v1.44.6/coder-cli-linux-amd64.tar.gz"
    sha256 "40caa4cc57cae3533b3a66bf6ca49e1931c3d265f0bd6fefa39ec927c23d1214"
  end

  keg_only :versioned_formula

  depends_on arch: :x86_64

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
