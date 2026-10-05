class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.37.4/coder_2.37.4_darwin_arm64.zip"
      sha256 "c5e3b5301f8e7ac2335c70bc97e8ddd5e9bb1a390c9f7775817109c90b9e5870"
    else
      url "https://github.com/coder/coder/releases/download/v2.37.4/coder_2.37.4_darwin_amd64.zip"
      sha256 "c553c9916929b09a2cd45c50c6f0b026e288c745778e37bc8b69a2633397e529"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.37.4/coder_2.37.4_linux_amd64.tar.gz"
    sha256 "e7bb6c08d7a37fd61c8a8b1d65c612fa6b84dc95a23f1e87c0e8440037ecb12c"
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
