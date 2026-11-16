class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.20/coder_2.34.20_darwin_arm64.zip"
      sha256 "e18298efb31a9ef0f903de28d7a01ec7c40e2961044120a9d64cc8a9b0a9dd5d"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.20/coder_2.34.20_darwin_amd64.zip"
      sha256 "325d10d3521c169b5b955f901be3c1bea75c69a413589e78d4fbe2ee71beb1a6"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.20/coder_2.34.20_linux_amd64.tar.gz"
    sha256 "dc1d340f1296d17619ba913797f383c610e89d9ca5561875804dd0c3350c6247"
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
