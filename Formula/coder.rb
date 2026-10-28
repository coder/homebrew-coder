class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.38.4/coder_2.38.4_darwin_arm64.zip"
      sha256 "cee887a2b8e31513eb0684a47b0256b967046acd6eecdabbd5b3677ad3ce9a16"
    else
      url "https://github.com/coder/coder/releases/download/v2.38.4/coder_2.38.4_darwin_amd64.zip"
      sha256 "8c03ca829617d8fd2acfd1cf1cf64d40fe385c1cb071bcb12a9aaa6125eeb2cc"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.38.4/coder_2.38.4_linux_amd64.tar.gz"
    sha256 "d1d906964852c32413402078d8379a9a2693fa17182703fa8fd77aa463841b2b"
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
