class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.39.2/coder_2.39.2_darwin_arm64.zip"
      sha256 "93710ec40a74f858e4026142bdb744dde0550d1ec2be8bbcf6ec6500315eabf6"
    else
      url "https://github.com/coder/coder/releases/download/v2.39.2/coder_2.39.2_darwin_amd64.zip"
      sha256 "a1a0ad34ae9c13dedb918e8844bbb27c0f4a3a76cc37395b90f515dad558f33d"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.39.2/coder_2.39.2_linux_amd64.tar.gz"
    sha256 "a184d9f8c7a5a08a10da49b1145c0c8f80284db2d6805e3e7658c6b26b5fd951"
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
