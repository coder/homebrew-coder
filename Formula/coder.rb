class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"
  version "2.1.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.1.4/coder_2.1.4_darwin_arm64.zip"
      sha256 "ac67c032e81fed7ef3b2e1fc5bfafb878e7551c081d0a136f5a88583c279c060"
    else
      url "https://github.com/coder/coder/releases/download/v2.1.4/coder_2.1.4_darwin_amd64.zip"
      sha256 "693d6c450891627d879123ea9a08dc5917dafee7de6c639c5c9b496abe6f250b"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.1.4/coder_2.1.4_linux_amd64.tar.gz"
    sha256 "41666bbe3afacd153fbe6c1a2d908bb4fb7a88e821205cb7136a0bad2d1cd6dc"
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
