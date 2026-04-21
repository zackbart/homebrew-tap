# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.19/seer_darwin_arm64.tar.gz"
      sha256 "e9d6f2b9685d78ba6073ecf4fb949efef48edb9709e0c7ba7d519cf9b8339008"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.19/seer_darwin_amd64.tar.gz"
      sha256 "b2315a723f3a767964dc95ad2867aca2de9557b68ca6c28277d584e3817046e8"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.19/seer_linux_amd64_baseline.tar.gz"
      sha256 "922262731dc50b0cff2a4ca43e6ec634b3c9cf314ffe57102e84851d406fe3bf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.19/seer_linux_arm64.tar.gz"
      sha256 "378dcecd62f72f44281eb2410bcb9114309dba68ded0eb5c3a0c91e52eec9595"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
