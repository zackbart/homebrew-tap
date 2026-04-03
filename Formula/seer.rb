# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.4/seer_darwin_arm64.tar.gz"
      sha256 "2e39f9d9b5dcb12d942f1239fc39e8fe2c474ab88bb99519569d273a6b965c1b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.4/seer_darwin_amd64.tar.gz"
      sha256 "e473551d6e277d44661e48415093ecac08b0d97849a7084032dfd1ce58c53df1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.4/seer_linux_amd64.tar.gz"
      sha256 "880ace5143a6b4e967cb8eabff0a97f382811406e45d9cfb47abb496b666feda"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.4/seer_linux_arm64.tar.gz"
      sha256 "82c32f07cdff5392bf00cb14084a850537ed3d3b3919152ac0734e2f63131afe"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
