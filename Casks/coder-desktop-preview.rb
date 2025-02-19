cask "coder-desktop-preview" do
  version "0.1.0-8-g7d5b6c7"
  sha256 :no_check

  url "https://github.com/coder/coder-desktop-macos/releases/download/preview/Coder.Desktop.dmg"
  name "Coder Desktop"
  desc "Coder Desktop client"
  homepage "https://github.com/coder/coder-desktop-macos"

  conflicts_with cask: "coder/coder/coder-desktop"
  depends_on macos: ">= :sonoma"

  app "Coder Desktop.app"
end
