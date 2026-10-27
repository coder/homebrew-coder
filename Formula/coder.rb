class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.35.11/coder_2.35.11_darwin_arm64.zip"
      sha256 "ac8cf40bbee40cf55cde029ce1641fa64e2922f612b1e7f3a1711a8c20ff14e4"
    else
      url "https://github.com/coder/coder/releases/download/v2.35.11/coder_2.35.11_darwin_amd64.zip"
      sha256 "eb96ad5e9acc04c2558ecfcf690239e4bb517eb139b633167f1d8f53f0c8c611"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.35.11/coder_2.35.11_linux_amd64.tar.gz"
    sha256 "c0a0edcb8c6aa1779ad176e568d9a9fb6bc7418d20e8143acb2d96ee918b3a6e"
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
