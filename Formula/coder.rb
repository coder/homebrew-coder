class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.27/coder_2.29.27_darwin_arm64.zip"
      sha256 "7f7dcb2dbbeab81b2fa0832ba45868da634fbe9a40731dc6cfa067b524b6e31a"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.27/coder_2.29.27_darwin_amd64.zip"
      sha256 "2908f4210c5e584b6dfa7718168b723be0cffe208eb42f230ec2cb825b1ffbaf"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.27/coder_2.29.27_linux_amd64.tar.gz"
    sha256 "223c5d30e6653149866a4cfa6cda381887841e691517002d9c02a860a569e93f"
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
