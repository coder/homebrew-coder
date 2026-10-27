class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.15/coder_2.34.15_darwin_arm64.zip"
      sha256 "56bf60df3dffbd20717117bd3ed1c60ccb34bf629a34318daeb88f1a5d5eb154"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.15/coder_2.34.15_darwin_amd64.zip"
      sha256 "1de028a0695166a30fe1817c49d6b3061ce2af9401e91de17e2bfdae0cb47909"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.15/coder_2.34.15_linux_amd64.tar.gz"
    sha256 "6696d1d7d3a910aae2126be40a5c8cd2a79d22b823e576f2563a5954aa25a9d3"
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
