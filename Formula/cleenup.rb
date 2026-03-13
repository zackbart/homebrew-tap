# typed: false
# frozen_string_literal: true

class Cleenup < Formula
  desc "Scan Claude Code and Codex CLI session logs for leaked secrets"
  homepage "https://github.com/zackbart/cleenup"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.2/cleenup_0.1.2_darwin_amd64.tar.gz"
      sha256 "bfb075fb2e8f747128612af42a876455887a975048969dcdfbe3afd4100b7193"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.2/cleenup_0.1.2_darwin_arm64.tar.gz"
      sha256 "b251a997278fda2fa5fcb90e8819f429ac38b2aaceb9d1fdff46eb818079a0ca"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.2/cleenup_0.1.2_linux_amd64.tar.gz"
      sha256 "1d479b12f1a45bb483ddbe6f8962fdafa4700738448b2ac69302019ae1ef2c78"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.2/cleenup_0.1.2_linux_arm64.tar.gz"
      sha256 "ab027d6d8d3358a916903d2582bdaee0a72668af5914bd7e0f44376773d41f82"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  test do
    assert_match "cleenup version 0.1.2", shell_output("#{bin}/cleenup --version")
  end
end
