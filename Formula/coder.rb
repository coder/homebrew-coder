class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.26/coder_2.29.26_darwin_arm64.zip"
      sha256 "d9f2404a639bca0f31551f00d44963d0c8f21ef53705047474ba8a060a90e0e9"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.26/coder_2.29.26_darwin_amd64.zip"
      sha256 "91827a65c37c8763fb11d35f6e6ad01fd205e3d9829a6ca57391b0b37699d8d7"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.26/coder_2.29.26_linux_amd64.tar.gz"
    sha256 "a7135fa377b92f02c9531474f18d42f78ebd2ede536013b5251a820cac9a0035"
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
