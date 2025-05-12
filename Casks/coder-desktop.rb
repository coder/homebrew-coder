cask "coder-desktop" do
  version "0.4.0"
  sha256 "294cd54d8c10cc1194dd52a13048db410b5b881e22730c7d2ef2607a85b9bc2e"

  url "https://github.com/coder/coder-desktop-macos/releases/download/v#{version}/Coder-Desktop.pkg"
  name "Coder Desktop"
  desc "Native desktop client for Coder"
  homepage "https://github.com/coder/coder-desktop-macos"

  conflicts_with cask: "coder/coder/coder-desktop-preview"
  depends_on macos: ">= :sonoma"

  pkg "Coder-Desktop.pkg"

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
