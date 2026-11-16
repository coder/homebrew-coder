class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.38.10/coder_2.38.10_darwin_arm64.zip"
      sha256 "f62bac3482a4f4bd8fb47a0b8a97eeea3999a35a9aa16246d5d17dbdf49d5ab0"
    else
      url "https://github.com/coder/coder/releases/download/v2.38.10/coder_2.38.10_darwin_amd64.zip"
      sha256 "cf408a6a507da72f80aeacf6783922ec6865641114af97300f04e827162df8cc"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.38.10/coder_2.38.10_linux_amd64.tar.gz"
    sha256 "3f4400d42b2518ba84c36467cf93037af4647dd75363cabcb38005f10844a57d"
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
