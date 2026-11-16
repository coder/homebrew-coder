class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.28/coder_2.29.28_darwin_arm64.zip"
      sha256 "254858d1bf7053759cb6393acf349ae26f57f83e3405eb6a0ea8505cd60ee4cb"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.28/coder_2.29.28_darwin_amd64.zip"
      sha256 "402dc4049c564ef3e54d3177f752e120eb8bd557c61e60d3eb23f27d5f10c3b3"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.28/coder_2.29.28_linux_amd64.tar.gz"
    sha256 "b9c19d6c01a6a5136017ceae9920b78ec6534ddf912e672d7735a9ace3712cfc"
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
