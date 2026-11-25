class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.15/coder_2.37.15_darwin_arm64.zip"
      sha256 "5d7af40f006424167fcd635918588c315b3b0ef081bf8cd65d9479cf58d12661"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.15/coder_2.37.15_darwin_amd64.zip"
      sha256 "ac052eebc8acf161721f04a43f71fefbe0397c4d9b6fbc8b307b03b825640a4b"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.15/coder_2.37.15_linux_amd64.tar.gz"
    sha256 "fa45df5c9157e57ad6faf3cda138a681b2fea860c5761cc5ae322b4b7e2acfa8"
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
