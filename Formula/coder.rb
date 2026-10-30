class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.17/coder_2.34.17_darwin_arm64.zip"
      sha256 "7c078330371ea4cea322952d90816a9a0c873fb9e83e7b06cc026944e8fda0e0"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.17/coder_2.34.17_darwin_amd64.zip"
      sha256 "b704cb177e2aca595dc82c4adeaffb80ba9cdf3a063e6ca04b59583779d55eec"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.17/coder_2.34.17_linux_amd64.tar.gz"
    sha256 "afdf8d333889e61d6deb0b88ab34f77f17cae536bff5171b12906f073d4fe111"
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
