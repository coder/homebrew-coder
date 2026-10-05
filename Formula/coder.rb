class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.35.9/coder_2.35.9_darwin_arm64.zip"
      sha256 "aae0e79dec9c485e6c72d04b817c3adec1a8c0ccc159a8873dd05051b71a527f"
    else
      url "https://github.com/coder/coder/releases/download/v2.35.9/coder_2.35.9_darwin_amd64.zip"
      sha256 "e806cb08dc15ac03348d4d6506a4dc37aab7ca351deffe969e10606dfe669cb2"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.35.9/coder_2.35.9_linux_amd64.tar.gz"
    sha256 "cd599562eaacb7d0fb35231cae249c7c781f5cd937ffc0ba582c0c9668783851"
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
