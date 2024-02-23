class CoderAT1 < Formula
  desc "Command-line tool for the Coder remote development platform"
  homepage "https://github.com/coder/coder-v1-cli"
  version "1.44.4"

  if OS.mac?
    url "https://github.com/coder/coder-v1-cli/releases/download/v#{version}/coder-cli-darwin-amd64.zip"
    sha256 "7e92a09972264cd1fac63f1327d69f119425a1bb0ca155f9ff84ef8ca251b7e5"
  else
    url "https://github.com/coder/coder-v1-cli/releases/download/v#{version}/coder-cli-linux-amd64.tar.gz"
    sha256 "787385a416fdfa1b5b2dfbc0c73f128b9d259e0701f56db73ca6156ae8078c4a"
  end

  keg_only :versioned_formula

  def version_suffix
    version.major.to_s
  end

  def install
    bin.install "coder"
  end

  test do
    system "#{bin}/coder", "--version"
  end
end
