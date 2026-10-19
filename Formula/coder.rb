class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.35.10/coder_2.35.10_darwin_arm64.zip"
      sha256 "c7052e990baed3f57c910e060903a20404a4ab7f30907651c4ac129a4319aa85"
    else
      url "https://github.com/coder/coder/releases/download/v2.35.10/coder_2.35.10_darwin_amd64.zip"
      sha256 "dbd9a4090c8fbbf3bcc4d1bb7b387513c5f0892961e1a610d95176a1aa97de01"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.35.10/coder_2.35.10_linux_amd64.tar.gz"
    sha256 "ebc5ac6b1ab5f32dae9a3e0818cb715a0d96780f3468c3c59c4620384c576874"
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
