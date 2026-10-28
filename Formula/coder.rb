class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.24/coder_2.29.24_darwin_arm64.zip"
      sha256 "c0f66f48af32163c1b4ca98f182a7bf4b1077f3e40789b1ad1c645b831a7ca3a"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.24/coder_2.29.24_darwin_amd64.zip"
      sha256 "d0ca9725b7eaedfbf0eab64833905b89cb7ab544d41c35248c7cf16b568654b1"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.24/coder_2.29.24_linux_amd64.tar.gz"
    sha256 "964c8a43ec2d39ce8f093db4624260917ce4424f297ad204fadde60429f3fef5"
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
