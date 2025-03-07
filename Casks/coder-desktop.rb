cask "coder-desktop" do
  version "0.2.0"
  sha256 "fc8f4f52ede37c6671f0c2285e56cf224f884afeb6fe84486e67c66f456180da"

  url "https://github.com/coder/coder-desktop-macos/releases/download/v#{version}/CoderDesktop.pkg"
  name "Coder Desktop"
  desc "Native desktop client for Coder"
  homepage "https://github.com/coder/coder-desktop-macos"

  conflicts_with cask: "coder/coder/coder-desktop-preview"
  depends_on macos: ">= :sonoma"

  pkg "CoderDesktop.pkg"

  uninstall quit:       [
              "com.coder.Coder-Desktop",
              "com.coder.Coder-Desktop.VPN",
            ],
            login_item: "Coder Desktop"

  zap delete: "/var/root/Library/Containers/com.Coder-Desktop.VPN/Data/Documents/coder-vpn.dylib",
      trash:  [
        "~/Library/Caches/com.coder.Coder-Desktop",
        "~/Library/HTTPStorages/com.coder.Coder-Desktop",
        "~/Library/Preferences/com.coder.Coder-Desktop.plist",
      ]
end
