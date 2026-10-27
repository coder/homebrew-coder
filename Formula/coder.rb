class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.35.12/coder_2.35.12_darwin_arm64.zip"
      sha256 "0bb59b080befbc86683610f5da301b2915b8ef41e54ddaa223a30f8826b41b2c"
    else
      url "https://github.com/coder/coder/releases/download/v2.35.12/coder_2.35.12_darwin_amd64.zip"
      sha256 "8f0dbe5026b36fbf8140bfe784121c57a8b00c90a6b341cf42989b84a4beb8b2"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.35.12/coder_2.35.12_linux_amd64.tar.gz"
    sha256 "f8592e339e6888216661a6614d93ae9f351d7c20e7d9ffbcb819201d35f1212e"
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
