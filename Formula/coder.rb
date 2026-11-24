class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.39.5/coder_2.39.5_darwin_arm64.zip"
      sha256 "9b14ff7f452ab049de0e34d3826c301db815611cf4a1cf07a3f85654ed4e22a2"
    else
      url "https://github.com/coder/coder/releases/download/v2.39.5/coder_2.39.5_darwin_amd64.zip"
      sha256 "960ca18b1a143026949b1131634fd28ebd3c7589e61aa4088956dee519cf3687"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.39.5/coder_2.39.5_linux_amd64.tar.gz"
    sha256 "be279de07fd225b8ac97b6b236afb51a108c9d32122cd4b975769930f6546556"
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
