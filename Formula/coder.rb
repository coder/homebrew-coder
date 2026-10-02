class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.12/coder_2.34.12_darwin_arm64.zip"
      sha256 "57bfe984a2a1c302dba303e0c7038fcbe84051e3bc9bae6e9ffcce628c177fbf"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.12/coder_2.34.12_darwin_amd64.zip"
      sha256 "a9dbbcb3888011d9ff16563516a0f58bcce3c72cac1ac23cb543f970903f40c3"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.12/coder_2.34.12_linux_amd64.tar.gz"
    sha256 "562ca8c7ac6fd1c8fa8636c66ac88ae446d70b2115c9522e872cef841ae002e3"
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
