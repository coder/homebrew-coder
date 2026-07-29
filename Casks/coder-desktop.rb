cask "coder-desktop" do
  version "0.8.3"
  sha256 "6e76662c6240906e789830c1fe955999d04d63b87dc767df6b192e8ee35845a5"

  url "https://github.com/coder/coder-desktop-macos/releases/download/v#{version}/Coder-Desktop.pkg"
  name "Coder Desktop"
  desc "Native desktop client for Coder"
  homepage "https://github.com/coder/coder-desktop-macos"

  auto_updates true
  depends_on macos: :sonoma

  pkg "Coder-Desktop.pkg"

  uninstall quit:       [
              "com.coder.Coder-Desktop",
              "com.coder.Coder-Desktop.Helper",
              "com.coder.Coder-Desktop.VPN",
            ],
            login_item: "Coder Desktop"

  zap delete: [
        "/var/root/Library/Application Support/com.coder.Coder-Desktop/coder-darwin-amd64",
        "/var/root/Library/Application Support/com.coder.Coder-Desktop/coder-darwin-arm64",
        "/var/root/Library/Containers/com.Coder-Desktop.VPN/Data/Documents/coder-vpn.dylib",
      ],
      trash:  [
        "~/Library/Caches/com.coder.Coder-Desktop",
        "~/Library/HTTPStorages/com.coder.Coder-Desktop",
        "~/Library/Preferences/com.coder.Coder-Desktop.plist",
      ]

  caveats <<~CAVEATS
    Coder Desktop must be installed in /Applications because it contains a
    System Network Extension, which macOS only activates when the containing
    app lives in /Applications. As this cask uses a `pkg` installer,
    HOMEBREW_CASK_OPTS=--appdir has no effect.
  CAVEATS
end
