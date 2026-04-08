# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.5/seer_darwin_arm64.tar.gz"
      sha256 "0076a378313307b9fcd33b638306e05e05d1e2a408afaa46823d8f0832395eef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.5/seer_darwin_amd64.tar.gz"
      sha256 "03661edbb1a2642937279622769cefb42d8761a1348ca73e0cc1a4694b2b7b30"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.5/seer_linux_amd64.tar.gz"
      sha256 "03b7f7f74e30eee5ecc5484f553ed18b0e33b08501c7c64450d726faa690b533"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.5/seer_linux_arm64.tar.gz"
      sha256 "1ab56c96caca037e57ae8dbae8d2f8cda552694e45dcf32946f5714a247d5468"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
