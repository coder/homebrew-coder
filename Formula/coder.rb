class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.30/coder_2.29.30_darwin_arm64.zip"
      sha256 "9bc4bd28bf41e0ab7262c8a75f1b0ef05610685e37a04cf78f1207a3cc6ce747"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.30/coder_2.29.30_darwin_amd64.zip"
      sha256 "897bc0c9c5e988c91d0e04c9bb89cb1282964aba385eb0f9ac141caaf4f887d1"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.30/coder_2.29.30_linux_amd64.tar.gz"
    sha256 "74457908cc342d834a0ba41f10eadbcce21e3121d24dda1a31e9135c0848cc41"
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
