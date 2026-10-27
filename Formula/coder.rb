class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.36.10/coder_2.36.10_darwin_arm64.zip"
      sha256 "90ae6255373fec25241b8eb697780c53c4b41119ee4c59916e5604c8ec005786"
    else
      url "https://github.com/coder/coder/releases/download/v2.36.10/coder_2.36.10_darwin_amd64.zip"
      sha256 "34e3cc6687133967b0aae06073d427d78c085d3f57c30ae1e1916b4032af3f4f"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.36.10/coder_2.36.10_linux_amd64.tar.gz"
    sha256 "31a143b98fc27bd8d2ccd3c53b6585c77f208a5582d0566d26bbbdf9b2a42000"
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
