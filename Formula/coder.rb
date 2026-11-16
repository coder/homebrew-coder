class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.39.4/coder_2.39.4_darwin_arm64.zip"
      sha256 "92a5f83fdce60c4efed0eb50f6e49e4425eeaff6ed556c0960c1dbcad1794a02"
    else
      url "https://github.com/coder/coder/releases/download/v2.39.4/coder_2.39.4_darwin_amd64.zip"
      sha256 "00fd1d4f64d58d8dafd8ffc2f177b055cc57aa07fe7932308b4bfe6228fb5e35"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.39.4/coder_2.39.4_linux_amd64.tar.gz"
    sha256 "b6ea29c51854447e7534b43ab19eccd37e3ce1f66393a67c4ac4257f7bdff7bf"
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
