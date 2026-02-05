class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"
  version "2.29.6"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_arm64.zip"
      sha256 "703860af167cd89f5a0cf141d996c8cf99f1d68fb717d1f3ba359db896ad4c1f"
    else
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_amd64.zip"
      sha256 "64a304d7fe88edbe143ddf33c21eb19bf95d4f419551b0cf7ea0ca82524e1749"
    end
  else
    url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_linux_amd64.tar.gz"
    sha256 "03312fd626932975ef22c280705c7b906cee3446e5f7ed481577b2e285b90128"
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
