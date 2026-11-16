class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.29/coder_2.29.29_darwin_arm64.zip"
      sha256 "66293ed587ef385cc72e94bc3cc2e90b056dab846bdad455031bbd8106ed8c39"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.29/coder_2.29.29_darwin_amd64.zip"
      sha256 "5086c3be3f8bf2d84de02925c0988167a595d43445ab15a1425d2ba564284e99"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.29/coder_2.29.29_linux_amd64.tar.gz"
    sha256 "324c599f1a3c585c8d68d5f22157f6b521cd90426f4a191ab8ef2dcc1c891244"
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
