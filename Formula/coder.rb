class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.36.11/coder_2.36.11_darwin_arm64.zip"
      sha256 "9488b4f4204c9d87e16ba37983d47676ced58091158b955b0ef1b6b1b676b447"
    else
      url "https://github.com/coder/coder/releases/download/v2.36.11/coder_2.36.11_darwin_amd64.zip"
      sha256 "9a402235318916b0c66d410f9dc39bfda79954c3b7733ab16ccb7b4d70196a43"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.36.11/coder_2.36.11_linux_amd64.tar.gz"
    sha256 "cc4f43934f55b2ff0952d4276d312cbd52fd9780d0bc8b97cd9c8947fa416995"
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
