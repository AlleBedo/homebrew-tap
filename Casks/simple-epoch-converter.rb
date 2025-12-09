cask "simple-epoch-converter" do
  version "1.0.0"
  sha256 "128c44ceb8d583bc3eb50dfd68278c53005a803bf76ccb026c6de28a68b0076b"

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
