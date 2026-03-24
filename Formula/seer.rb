# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.0/seer_darwin_arm64.tar.gz"
      sha256 "3f9489703fa4c14f80ed725b57e69fad475b082dbdb81270f66f741b3b38743c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.0/seer_darwin_amd64.tar.gz"
      sha256 "80cca95b532113d8fde8e47b428d7d90a1db495f313c315a499ad004bc08e3e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.0/seer_linux_amd64.tar.gz"
      sha256 "471ed43b39e30a5f0df2e757cffd035b434da8029752c4d140e4dbe52796396f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.0/seer_linux_arm64.tar.gz"
      sha256 "4feba93ccbe2b6485836463a8b75ba322f77ab6b0aebf0c82595ad6b64beba3a"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
