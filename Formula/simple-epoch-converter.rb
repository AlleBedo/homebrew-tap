# Formula template for Homebrew
# After creating a GitHub release, replace the placeholders below

class SimpleEpochConverter < Formula
  desc "Simple and fast macOS menu bar application to convert epoch timestamps"
  homepage "https://github.com/AlleBedo/SimpleEpochConverter"
  url "https://github.com/AlleBedo/SimpleEpochConverter/releases/download/v1.0.0/SimpleEpochConverter-1.0.0.zip"
  sha256 "b0f80386d37854751521dc6e0dc7aa70faf8d0b54c501396fd5378d5a62afd24"
  version "1.0.0"

  depends_on :macos => :ventura

  def install
    prefix.install "SimpleEpochConverter.app" => "SimpleEpochConverter.app"
  end

  def caveats
    <<~EOS
      SimpleEpochConverter has been installed to:
        #{prefix}/SimpleEpochConverter.app

      To use it, either:
        1. Open it from Applications folder
        2. Run: open -a SimpleEpochConverter
        3. Run: brew services start simple-epoch-converter

      On first launch, you'll need to grant Accessibility permissions:
        System Preferences → Privacy & Security → Accessibility
        
      Default shortcut: ⌘ + ⇧ + E
      
      You can customize the shortcut in Settings (right-click menu bar icon).
    EOS
  end

  test do
    assert_predicate prefix/"SimpleEpochConverter.app", :exist?
  end
end
