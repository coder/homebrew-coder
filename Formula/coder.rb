class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.35.3/coder_2.35.3_darwin_arm64.zip"
      sha256 "ca8d9787de86f85a479c060e695bc9dafbb5e336248047116480033d338f4bb2"
    else
      url "https://github.com/coder/coder/releases/download/v2.35.3/coder_2.35.3_darwin_amd64.zip"
      sha256 "4aa7808c9618787fb42e20f2ab974a0edf6c803b439b13e87cb2c0e9c23acd19"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.35.3/coder_2.35.3_linux_amd64.tar.gz"
    sha256 "07874e0d2efae597647661178935d8000ee7959b6fe6d7ac3ce57ed2438d4a2e"
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
