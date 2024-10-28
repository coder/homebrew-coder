class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"
  version "2.16.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_arm64.zip"
      sha256 "fed2a2155af4e8490039cb6b4379f71a3153ec1af225f6155243ff4eac36204e"
    else
      url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_darwin_amd64.zip"
      sha256 "8adf97683f599fd9894294beb0d376746547d29183caffd49ce3d94368679347"
    end
  else
    url "https://github.com/coder/coder/releases/download/v#{version}/coder_#{version}_linux_amd64.tar.gz"
    sha256 "32ffb8c45ba2973194e1c70385cf97864e7e70df22c40f00a62e72389b50db16"
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
