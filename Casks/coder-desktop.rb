cask "coder-desktop" do
  version "0.7.0"
  sha256 "e0c46304cab0d2266169f3753277b81e131e3e8fac69fbe6eed1da09e0de8c09"

  url "https://github.com/coder/coder-desktop-macos/releases/download/v#{version}/Coder-Desktop.pkg"
  name "Coder Desktop"
  desc "Native desktop client for Coder"
  homepage "https://github.com/coder/coder-desktop-macos"

  auto_updates true
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
