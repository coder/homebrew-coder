class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.39.1/coder_2.39.1_darwin_arm64.zip"
      sha256 "5d052ac570ce1829747b7d971ae19f7d5ea2c3bba3e2e916a6973df87a3484db"
    else
      url "https://github.com/coder/coder/releases/download/v2.39.1/coder_2.39.1_darwin_amd64.zip"
      sha256 "0281a11cd51998c5250194307cf1bf6b14b2f27d4c73ebd22594376e4d2cc43c"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.39.1/coder_2.39.1_linux_amd64.tar.gz"
    sha256 "1251f499f617d765cadaadf11fa6d55c6f022cf1f0828d10cde376c10b460ada"
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
