# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.15/seer_darwin_arm64.tar.gz"
      sha256 "bdc5d93621c74f59c562f9bbd9388c780a3d083df198f85c64961eaf8b7a3290"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.15/seer_darwin_amd64.tar.gz"
      sha256 "894f319df4762b79a9a74f5b1b4fe84bf2bf70f088fc6da5d8ae4c919a7f982f"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.15/seer_linux_amd64_baseline.tar.gz"
      sha256 "b87711c5059087618c2cf9ac2aaeb469b0433ad2c1bf8d41531a9e1fb82c05b6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.15/seer_linux_arm64.tar.gz"
      sha256 "36603d91e31714c1be400e23300b50a9b6d5fe62580aee09a55f64353082deb9"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
