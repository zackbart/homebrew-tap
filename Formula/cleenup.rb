# typed: false
# frozen_string_literal: true

class Cleenup < Formula
  desc "Scan Claude Code and Codex CLI session logs for leaked secrets"
  homepage "https://github.com/zackbart/cleenup"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.1/cleenup_0.1.1_darwin_amd64.tar.gz"
      sha256 "7753f90d2946e0dd2fa7d75ee865806c5f67ba10ae3741e68243464e1f4a8202"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.1/cleenup_0.1.1_darwin_arm64.tar.gz"
      sha256 "87ba1f24c61fd3ae35f63296557a1d191f38c890d4c48552439e8f33bc97681d"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.1/cleenup_0.1.1_linux_amd64.tar.gz"
      sha256 "7fb3d06783aecaab7b4faa6f76a42821eaab8fdd471863d173c705fc6fc6edc0"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.1/cleenup_0.1.1_linux_arm64.tar.gz"
      sha256 "c66f1253225ffc500a7545433d5386e49b9ba89b7f99f946e1ed3ae7ed28e0a7"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  test do
    assert_match "cleenup version 0.1.1", shell_output("#{bin}/cleenup --version")
  end
end
