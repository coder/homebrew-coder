cask "coder-desktop" do
  version "0.7.1"
  sha256 "f007e70f4f6e8279082c4996d2a8477db3e39ee3a1c40a30fa435bfade90ed86"

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
