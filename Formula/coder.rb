class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.38.0/coder_2.38.0_darwin_arm64.zip"
      sha256 "ffcecefd505e160677ba66c8d812962e970010384f7287e4dc9ab5dc461fd3e7"
    else
      url "https://github.com/coder/coder/releases/download/v2.38.0/coder_2.38.0_darwin_amd64.zip"
      sha256 "8437fa800e1e60fc80564203db7255d94cdec9d3a810c2b3026f55f897d88489"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.38.0/coder_2.38.0_linux_amd64.tar.gz"
    sha256 "6c9026af45f10190517aa317d02d07f3dce50c8c1544822fd6531596c438ed76"
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
