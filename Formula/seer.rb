# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.2/seer_darwin_arm64.tar.gz"
      sha256 "0a3d2d7dcfa80ac40fba98411e3c1e7db7dd0037fbb213d096248f2f0233b75f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.2/seer_darwin_amd64.tar.gz"
      sha256 "9bc3ebd73ef725fa2e5a25d64ae7892f553a020c2f376a27023098631c273244"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.2/seer_linux_amd64.tar.gz"
      sha256 "24555460730c3fcd5b9204f00ebae5c929e27e6bdd725009af5c47ae9767a3bf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.2/seer_linux_arm64.tar.gz"
      sha256 "095519e93eafd3018e817a3df24e865fcb2c6e21a6a8c13455a55f34ffebf7a5"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
