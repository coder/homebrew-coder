cask "mux" do
  arch arm: "arm64", intel: "x64"

  version "0.15.2"
  sha256 arm:          "4e0b9fefc123a3fb81fbd91d9e787bdb73813779985dc5cf3f572052def07a83",
         x86_64:       "76e73b8aa2cd67d8618aa6d56060554967704c58f1393133b7b8e783b6ca85f4",
         x86_64_linux: "76e73b8aa2cd67d8618aa6d56060554967704c58f1393133b7b8e783b6ca85f4",
         arm64_linux:  "4e0b9fefc123a3fb81fbd91d9e787bdb73813779985dc5cf3f572052def07a83"

  url "https://github.com/coder/mux/releases/download/v#{version}/mux-#{version}-#{arch}.dmg",
      verified: "github.com/coder/mux/"
  name "Mux"
  desc "Desktop app for parallel agent workflows"
  homepage "https://mux.coder.com/"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "mux.app"

  uninstall quit: "com.mux.app"

  zap trash: [
    "~/Library/Application Support/mux",
    "~/Library/Caches/com.mux.app",
    "~/Library/HTTPStorages/com.mux.app",
    "~/Library/Logs/mux",
    "~/Library/Preferences/com.mux.app.plist",
    "~/Library/Saved Application State/com.mux.app.savedState",
  ]
end
