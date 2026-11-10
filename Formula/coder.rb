class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.19/coder_2.34.19_darwin_arm64.zip"
      sha256 "71288d9a42f522871d7ea82edc14fed6452cf260f48b530906d55a5ec1fc14d3"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.19/coder_2.34.19_darwin_amd64.zip"
      sha256 "6d692fcdeb6eed6fc5b27b51884a2d8e8409527f142512fd22e16580c16311f3"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.19/coder_2.34.19_linux_amd64.tar.gz"
    sha256 "526d82e4c59663000f8d087b63d21ec8233527a6799f63a449a906f4e69b1ba5"
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
