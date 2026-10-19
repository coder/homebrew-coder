class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.13/coder_2.34.13_darwin_arm64.zip"
      sha256 "5e0e32e3bc1483c10fce1ae99b939e70e119d96aa1b22df74db16cefb46120f2"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.13/coder_2.34.13_darwin_amd64.zip"
      sha256 "bb50548b3b46ea3aa6ac782e14c27c056646525182d2b623e9ddd588f7af96b0"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.13/coder_2.34.13_linux_amd64.tar.gz"
    sha256 "88e3273a69ab028797c26cfea52641c9bba26cb4292bfba5f626b12b0b6764b4"
  end

  def install
    bin.install "coder"
  end

  test do
    version_output = shell_output("#{bin}/coder version")
    assert_match version.to_s, version_output
    refute_match "AGPL", version_output
    assert_match "Full build", version_output

    assert_match "You are not logged in", shell_output("#{bin}/coder netcheck 2>&1", 1)
    assert_match "postgres://", shell_output("#{bin}/coder server postgres-builtin-url")
  end
end
