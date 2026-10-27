class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.38.3/coder_2.38.3_darwin_arm64.zip"
      sha256 "701ff019fe42187fc4a3bc016ed40a66518e4abc718cf10572ccdfc704d5c48c"
    else
      url "https://github.com/coder/coder/releases/download/v2.38.3/coder_2.38.3_darwin_amd64.zip"
      sha256 "b57b238e63c8d73f53ea7d8795145590a616e1dec0d52dffde9807d9244af2c0"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.38.3/coder_2.38.3_linux_amd64.tar.gz"
    sha256 "bf04b6428b76be076a6fedc049da46b21c9daacabb64c2d59ab5d70e2c3bf1d5"
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
