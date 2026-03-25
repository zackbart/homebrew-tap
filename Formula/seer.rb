# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.1/seer_darwin_arm64.tar.gz"
      sha256 "5284a50dd06ec3e6677c22e4a510877541b75fdb4b76c7fd957fa29fd526cff3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.1/seer_darwin_amd64.tar.gz"
      sha256 "2e44c06c8b3bfb1f7fa56f47627da5958ee2e3fc1c3d822a9a782c1e84f71c34"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.1/seer_linux_amd64.tar.gz"
      sha256 "a7521cddc1f4f4e80cf68ac0c096394e659537e3b530cdb38833c3e2255641ca"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.1/seer_linux_arm64.tar.gz"
      sha256 "dc43cd927db525df6044635826d27c0539d40daaa07b6b5a15f7ef33d7c0f3eb"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
