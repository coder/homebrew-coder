cask "coder-desktop-preview" do
  version "0.1.0-5-gccfc849"
  sha256 "ee609c2833f74c875dcdfca713a9f3327a7a57212e484ce07cf210207ea16332"

  url "https://github.com/coder/coder-desktop-macos/releases/download/preview/Coder.Desktop.dmg"
  name "Coder Desktop"
  desc "Coder Desktop client"
  homepage "https://github.com/coder/coder-desktop-macos"

  depends_on macos: ">= :sonoma"

  app "Coder Desktop.app"
  conflicts_with cask: "coder/coder/coder-desktop"
end
