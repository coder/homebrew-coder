class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.36.12/coder_2.36.12_darwin_arm64.zip"
      sha256 "260dae26e3cafbc7f1cb596798c44428254bcf7f6720cf43e85933a5ac78112c"
    else
      url "https://github.com/coder/coder/releases/download/v2.36.12/coder_2.36.12_darwin_amd64.zip"
      sha256 "170ce80c31ec5a40fb3a46942bc70529321a0ee8a4c81ab8b10125d94591c7d5"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.36.12/coder_2.36.12_linux_amd64.tar.gz"
    sha256 "1789c4d9f1882a3300fdfcfbbae2ed33def99128e5cd708a3f99c03c34feca68"
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
