# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.3/seer_darwin_arm64.tar.gz"
      sha256 "3b62e8795febb6000695dd96b7be51e3d3218ea59264c0e90b5209f062f0c80f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.3/seer_darwin_amd64.tar.gz"
      sha256 "a62c6b04bbdfa943d61542043a1f53e0867710799a9ff45373143122f2389fcf"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.3/seer_linux_amd64.tar.gz"
      sha256 "43c3430cef6bd320648c462877aee7f7f412c97511657755f4cb65c56b7a145f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.3/seer_linux_arm64.tar.gz"
      sha256 "5ca5001073d5cd762749ea1c31d6e8fcb66f8ad1a02f9131b4e84f332326de47"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
