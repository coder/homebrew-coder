class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.16/coder_2.34.16_darwin_arm64.zip"
      sha256 "5a6a25c9f68584272458cfa4a32273cfd0576674f583adcb40929bb0cb5dc30a"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.16/coder_2.34.16_darwin_amd64.zip"
      sha256 "9e82cf99832a226a8118f04c76e454f97351f3e6549e577bc901abeb51ef0098"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.16/coder_2.34.16_linux_amd64.tar.gz"
    sha256 "53e7fb7f365c539b256316fd78715e4aad7375c13d21192ea84ec31c3ebaa523"
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
