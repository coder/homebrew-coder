class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.39.0/coder_2.39.0_darwin_arm64.zip"
      sha256 "3d8162bd2d4948bfb5f3559f59e7ca1b4b174a1d86b4dd10034cb436efda2c04"
    else
      url "https://github.com/coder/coder/releases/download/v2.39.0/coder_2.39.0_darwin_amd64.zip"
      sha256 "166a5ef7dea8a4e32e92e86e151c10b4d246b09060264786c12594120a2d1af7"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.39.0/coder_2.39.0_linux_amd64.tar.gz"
    sha256 "49bdd000dac448f110e23b9e0712cd5b51ca8a345f9c7061d59dd3cb526d4fe5"
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
