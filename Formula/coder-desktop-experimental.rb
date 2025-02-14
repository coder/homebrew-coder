cask "coder-desktop-experimental" do
  version "v0.1.1-ci.2"
  sha256 "632a8cd8c6a5e758f7c0c2f0193c48e5093949f761434222da7f1e921d5ad338"

  url "https://github.com/coder/coder-desktop-macos/releases/download/#{version}/Coder.Desktop.dmg"
  name "Coder Desktop"
  desc "Coder Desktop client"
  homepage "https://github.com/coder/coder-desktop-macos"

  depends_on macos: ">= :sonoma"

  app "Coder Desktop.app"
end
