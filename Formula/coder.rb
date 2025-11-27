class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"
  version "2.28.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_arm64.zip"
      sha256 "f80c3e49323cf3606ccc5f4fa0b765ebdb768f0a9c9d79aed421016785a70271"
    else
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_amd64.zip"
      sha256 "626da42b8c10a2f5bf0281c24bfd4377aa019935ad6e7eea1b68b41c6c7d10df"
    end
  else
    url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_linux_amd64.tar.gz"
    sha256 "bc2322d53a935ddb2c551a035e51805f899207479e7f8069373b4e781136071f"
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
