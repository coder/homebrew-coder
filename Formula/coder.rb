class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.14/coder_2.37.14_darwin_arm64.zip"
      sha256 "a3429768eee61893680db1395f0ed9014102d8115b1537324ce184a20fc614c9"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.14/coder_2.37.14_darwin_amd64.zip"
      sha256 "e409d99f557a482c39bfe4a6a509540bd71ec22c940199417cb41d1aabde3cdf"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.14/coder_2.37.14_linux_amd64.tar.gz"
    sha256 "e17adea0da840f2a40d61395312bdff07946b421fce640ea4df0311ff8ee588b"
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
