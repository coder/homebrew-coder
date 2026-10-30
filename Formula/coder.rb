class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.38.5/coder_2.38.5_darwin_arm64.zip"
      sha256 "bb62d7b60dd982d440c2c6ddb197f5d6f8d80ca1bc298fddefe22e79bf9461b4"
    else
      url "https://github.com/coder/coder/releases/download/v2.38.5/coder_2.38.5_darwin_amd64.zip"
      sha256 "12df64e8c9ab621a5fed876b1ef6e00a88e1af10176c0c494b1c1a113b6a9bbf"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.38.5/coder_2.38.5_linux_amd64.tar.gz"
    sha256 "f8e16e9d64258fa9b4d640e1f3899f8a76c064326f3ee495b798d7c2361b7ee7"
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
