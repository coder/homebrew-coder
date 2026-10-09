class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.21/coder_2.29.21_darwin_arm64.zip"
      sha256 "d6a6539d26d8fd032cf7a6367e9d697bf72dd3e947c2402012f887ba11ad66a7"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.21/coder_2.29.21_darwin_amd64.zip"
      sha256 "e161b00372edb823df4e7ea76059d20697f6775aceabdd5d95adb89fc5cea8b8"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.21/coder_2.29.21_linux_amd64.tar.gz"
    sha256 "3845df003ab3487d525ec5e1f12300e9203a3a78df465d8dc825d4fd031e86b2"
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
