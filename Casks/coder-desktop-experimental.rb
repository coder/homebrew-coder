cask "coder-desktop-experimental" do
  version "v0.1.1-ci.4"
  sha256 "16100b18acf048edee152a1fbbc2934903c69ea987327ea28c4460d4289d7cb2"

  url "https://github.com/coder/coder-desktop-macos/releases/download/#{version}/Coder.Desktop.dmg"
  name "Coder Desktop"
  desc "Coder Desktop client"
  homepage "https://github.com/coder/coder-desktop-macos"

  depends_on macos: ">= :sonoma"

  app "Coder Desktop.app"
end
