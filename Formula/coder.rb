class Coder < Formula
  desc "Provisions remote development environments via Terraform"
  homepage "https://github.com/coder/coder"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/coder/coder/releases/download/v2.29.22/coder_2.29.22_darwin_arm64.zip"
      sha256 "fa6878a3f84eb5cec6496a4bd7987af60a6abfb3e9dd357cb4cca0807e05f0d5"
    else
      url "https://github.com/coder/coder/releases/download/v2.29.22/coder_2.29.22_darwin_amd64.zip"
      sha256 "98d7c23ced6ee42e87c7c6e0e90754bb68c102ceaac498f8d9c5bdf5134590d8"
    end
  else
    url "https://github.com/coder/coder/releases/download/v2.29.22/coder_2.29.22_linux_amd64.tar.gz"
    sha256 "30bf3df99bd6039bbf66435ec3f4f66a176d7f431a4b777245b8585464ddcc16"
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
