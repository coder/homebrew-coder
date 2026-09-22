class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.3/coder_2.37.3_darwin_arm64.zip"
      sha256 "e3dcdfc405468c4ac53674a306ab2540261e1076d25cc1f359df9fcf791d230e"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.3/coder_2.37.3_darwin_amd64.zip"
      sha256 "4fd6acdb59f1e2e7a60ff97e385b710f68dac63e4739238198f398597a1ea7e6"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.3/coder_2.37.3_linux_amd64.tar.gz"
    sha256 "c941bef3b2656da89e9ea9b509884085b99b7d7a08620abd8484c50d77f41eed"
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
