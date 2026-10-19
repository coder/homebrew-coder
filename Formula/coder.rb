class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.36.8/coder_2.36.8_darwin_arm64.zip"
      sha256 "45ddd0331c40b25e56c8b360a82887348700beee4ab561d9f0668a29ba40cf0e"
    else
      url "https://github.com/coder/coder/releases/download/v2.36.8/coder_2.36.8_darwin_amd64.zip"
      sha256 "10b2fd2aaad3c6158fa168e94f19b8f9aa0fc27b00e480b99c01e0a80916af02"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.36.8/coder_2.36.8_linux_amd64.tar.gz"
    sha256 "d751a63888dd6cb3e7342b51f186f2068ba21d10b7a76cafffe2ff123270e485"
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
