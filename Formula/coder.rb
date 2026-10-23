class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.36.9/coder_2.36.9_darwin_arm64.zip"
      sha256 "f4d780a7109daa6f114202ec7705cfe91fa5ce4438d153e27f6955749a4733ee"
    else
      url "https://github.com/coder/coder/releases/download/v2.36.9/coder_2.36.9_darwin_amd64.zip"
      sha256 "6bcffb8fae2f2f5adc5f54d29466024e3e057ec6e11424718e5bd929b2e4b5c0"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.36.9/coder_2.36.9_linux_amd64.tar.gz"
    sha256 "a2f0fcdb2744ce926c51a8a37b9364f00d18c52b135ece2462759fee90894052"
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
