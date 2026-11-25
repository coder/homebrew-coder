class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.22/coder_2.34.22_darwin_arm64.zip"
      sha256 "b021f9ee54178921cbf36557661ac4b3ddd25a3627083789a657581b35b31781"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.22/coder_2.34.22_darwin_amd64.zip"
      sha256 "55c5dc27b6b81b3fdcbc926c4800fa001e8edfb88da58701a0e25b846986aec3"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.22/coder_2.34.22_linux_amd64.tar.gz"
    sha256 "cab34d15bf6574808577c9ca2530ee17243e25f55ad9a0cd19380f46181671f6"
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
