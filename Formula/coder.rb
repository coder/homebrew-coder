class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"
  version "2.13.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_arm64.zip"
      sha256 "9c75acb21a0c49bad374f9705d0f295f3337f660af792120b9dfbed77e5f5115"
    else
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_amd64.zip"
      sha256 "620272f0d71716ab9036b3e1b07e593621f876e756274c2ea9f9fcf9fa9b7256"
    end
  else
    url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_linux_amd64.tar.gz"
    sha256 "d46025b9de70f99f194448e6c2bf4e65f6b7e22b5f9b94bcbe65a4c334cdabbc"
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
