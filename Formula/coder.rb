class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.18/coder_2.34.18_darwin_arm64.zip"
      sha256 "8456dd074c95e3e18babb19b38027a1c882d674d6889e44a3334be4b51c7be17"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.18/coder_2.34.18_darwin_amd64.zip"
      sha256 "80927e386232dfd1314f882a1d161007636b1625fe94b78071e21a723e9d40fb"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.18/coder_2.34.18_linux_amd64.tar.gz"
    sha256 "e335a05bfe70b85365bcf3e2e45bfc02428f71ea19b69a96e28ca38cef669222"
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
