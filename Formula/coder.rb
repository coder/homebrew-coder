class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.2/coder_2.37.2_darwin_arm64.zip"
      sha256 "20d14f83ac14bb83bf0abf94f68ff4e7d6dfaf88374186566c6d7b0d4f0a7899"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.2/coder_2.37.2_darwin_amd64.zip"
      sha256 "c040c6413e3fee67e4293c7c344d0cc3384b88426a69d6a62c5f6c01aeadc22f"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.2/coder_2.37.2_linux_amd64.tar.gz"
    sha256 "81297a796938bd8c82000502be899a8a2611503976c0f550dfbadd1cc1f4eb36"
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
