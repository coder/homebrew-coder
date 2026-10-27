class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.23/coder_2.29.23_darwin_arm64.zip"
      sha256 "b45f86d133b001946438aa45779c7362d41e7e7e836640d1ee76c5d97279f9e2"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.23/coder_2.29.23_darwin_amd64.zip"
      sha256 "83cc75cac8912d51573d1ae939f016a90d6c66cd048c33fe70a3899bbdcf459b"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.23/coder_2.29.23_linux_amd64.tar.gz"
    sha256 "e244d342271705d70e41961ac22896de5f4f7d6c94c5e5e80a355e10660b878b"
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
