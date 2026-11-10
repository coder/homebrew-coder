class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.11/coder_2.37.11_darwin_arm64.zip"
      sha256 "759952062b8f8ec5e2dfec31f4f58cc5bd02212cd22ca21faa2450c1586d290f"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.11/coder_2.37.11_darwin_amd64.zip"
      sha256 "e54a31337fab22117d95c243e75edc10c97b46db87c05e59055f22e541871f71"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.11/coder_2.37.11_linux_amd64.tar.gz"
    sha256 "56e235fc413f567cecdb25de4f3e37f065c464f4a859e0d38d2cea5ed05ef68b"
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
