cask "coder-desktop-experimental" do
  version "v0.1.1-ci.3"
  sha256 "201af13f4e45b4a91d23e36611f23e05bea0539139b12d7106f94cedb16d6646"

  url "https://github.com/coder/coder-desktop-macos/releases/download/#{version}/Coder.Desktop.dmg"
  name "Coder Desktop"
  desc "Coder Desktop client"
  homepage "https://github.com/coder/coder-desktop-macos"

  depends_on macos: ">= :sonoma"

  app "Coder Desktop.app"
end
