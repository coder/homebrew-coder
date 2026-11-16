class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.12/coder_2.37.12_darwin_arm64.zip"
      sha256 "37e2a3ccaf3311c6bb7a65a4a84ad4aa5d69fa0eea840de1c059ed216d629bf6"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.12/coder_2.37.12_darwin_amd64.zip"
      sha256 "0c80a1e738f0a510a124550339fdda5a5958a38b134f3346e067ec55c6699fe6"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.12/coder_2.37.12_linux_amd64.tar.gz"
    sha256 "9950a214091d6664b0d6730adb02f94071a1b14c96c9500cbedf4745b9b74ef6"
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
