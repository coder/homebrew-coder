class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.38.1/coder_2.38.1_darwin_arm64.zip"
      sha256 "ac5aaae38e7891a0969d400f9df581c729e50aa6154c2a0cdc7db85be2350609"
    else
      url "https://github.com/coder/coder/releases/download/v2.38.1/coder_2.38.1_darwin_amd64.zip"
      sha256 "2218748ddc95b38cb3ad2e9f6de78ba5b04e6b4daa4e016be9640de52225ca4a"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.38.1/coder_2.38.1_linux_amd64.tar.gz"
    sha256 "9580ecbd7fd350046ff53194541983744fff2fb1c8e491a98922dd7b6cb34ff6"
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
