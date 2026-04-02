cask "simple-epoch-converter" do
  version "1.1.0"
  sha256 "11941968ceed80a2f70a127d732208142efb524b236b65fb2187688583b06aff"

  url "https://github.com/AlleBedo/SimpleEpochConverter/releases/download/v#{version}/SimpleEpochConverter-#{version}.zip"
  name "Simple Epoch Converter"
  desc "Simple and fast macOS menu bar application to convert epoch timestamps"
  homepage "https://github.com/AlleBedo/SimpleEpochConverter"

  depends_on macos: ">= :ventura"

  app "SimpleEpochConverter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SimpleEpochConverter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.alessandrobedini.SimpleEpochConverter.plist",
  ]

  caveats <<~EOS
    SimpleEpochConverter has been installed!

    On first launch, you'll need to grant Accessibility permissions:
      System Settings → Privacy & Security → Accessibility

    If macOS blocks the app due to "unidentified developer":
      Go to System Settings → Privacy & Security
      Click "Open Anyway" next to the SimpleEpochConverter message

    Or run: xattr -cr /Applications/SimpleEpochConverter.app

    Default shortcut: ⌘ + ⇧ + E
    You can customize the shortcut from the app's settings menu (right-click the menu bar icon).

    To launch at login, enable it in the app's settings menu.
  EOS
end
