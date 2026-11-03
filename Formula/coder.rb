class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.10/coder_2.37.10_darwin_arm64.zip"
      sha256 "c7f0f4c5a9856fe4f53018cf498a5ffc2dc36be9a243d51c95fe02a0942c9c61"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.10/coder_2.37.10_darwin_amd64.zip"
      sha256 "9fac432f850b2ad27b4c5b60540f2b079c7a02b9c0d0c4690d6f207b564743a2"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.10/coder_2.37.10_linux_amd64.tar.gz"
    sha256 "90b602f67d26f01986dffffaafb5c52d0c31c711e45e011bdac4c1b3b52dfcb5"
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
