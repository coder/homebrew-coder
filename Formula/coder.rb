class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.34.21/coder_2.34.21_darwin_arm64.zip"
      sha256 "52da8f632c5ba1e2dfadfa86606be3868f1c61780608c049e06d29368fdbdbe9"
    else
      url "https://github.com/coder/coder/releases/download/v2.34.21/coder_2.34.21_darwin_amd64.zip"
      sha256 "8c3bb1a2ef7a6d128e020362c52e03e25ed3e977ea13668664358515baed024d"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.34.21/coder_2.34.21_linux_amd64.tar.gz"
    sha256 "ed1f76903a17679d039f9f2c812427024fcfc4d268d195f15812f53f8a530cd1"
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
