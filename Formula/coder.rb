class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"
  version "2.10.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_arm64.zip"
      sha256 "6904a25caeefa0fe7f98f148b1c7d39d273801ee7f7fe596f0c47a66db82fde6"
    else
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_amd64.zip"
      sha256 "535790698c279bf99d42867c6312bffacdc76e855f30802d748eda4270a20ccf"
    end
  else
    url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_linux_amd64.tar.gz"
    sha256 "8cd3cbdf47b9c6fc9a8e522a8afb44a526f771185f80584b1650be09a2d8d883"
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
