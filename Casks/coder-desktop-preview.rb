cask "coder-desktop-preview" do
  version "0.5.1.6"
  sha256 :no_check

  url "https://github.com/coder/coder-desktop-macos/releases/download/preview/Coder-Desktop.pkg"
  name "Coder Desktop"
  desc "Native desktop client for Coder"
  homepage "https://github.com/coder/coder-desktop-macos"

  deprecate! date: "2025-06-02", because: "preview builds should now be installed via the built-in update mechanism. We recommend uninstalling this cask, installing the non-preview version, and then switching to the 'preview' channel in the app settings."

  conflicts_with cask: "coder/coder/coder-desktop"
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
