class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.14/coder_2.34.14_darwin_arm64.zip"
      sha256 "207693b242f3002711f7293e87caddfd804caea0182d1196b1c0cf21d854d8a5"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.14/coder_2.34.14_darwin_amd64.zip"
      sha256 "9dfbcddc771250fe3d995b881e60b22afe80565b252fa10d1180c873f8712d17"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.14/coder_2.34.14_linux_amd64.tar.gz"
    sha256 "a28ebfdead70afc3c7ea19092a27f27fed53988fdec1c84ff530c5adb6148267"
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
