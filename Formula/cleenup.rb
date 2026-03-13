# typed: false
# frozen_string_literal: true

class Cleenup < Formula
  desc "Scan Claude Code and Codex CLI session logs for leaked secrets"
  homepage "https://github.com/zackbart/cleenup"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.3/cleenup_0.1.3_darwin_amd64.tar.gz"
      sha256 "9632e1bcbf63394b8695df424586ef39af77a3d5a278d355fcf222245aed2a62"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.3/cleenup_0.1.3_darwin_arm64.tar.gz"
      sha256 "63f3fdc2d83bd96fa29bf87e52ae4c7e10661d154692e707ef4c7d2b2e3b520c"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.3/cleenup_0.1.3_linux_amd64.tar.gz"
      sha256 "b16ff5e52d69e03a2d09951a6f6c87635702a95584355ebea7b30aa676b9d90b"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.3/cleenup_0.1.3_linux_arm64.tar.gz"
      sha256 "e76eab507bdaca9c6db408e0f6f06a903ba334f0b4813a7c77d0f88f1d2007a3"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  test do
    assert_match "cleenup version 0.1.3", shell_output("#{bin}/cleenup --version")
  end
end
