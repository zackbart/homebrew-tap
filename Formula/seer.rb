# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.21/seer_darwin_arm64.tar.gz"
      sha256 "087e1ea44fa5360fe1bae1d34a720ee4bc7a3c85f5e2b26833482c5189281c2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.21/seer_darwin_amd64.tar.gz"
      sha256 "9eb4a25d3ef776851520a4b876cf0d043e5af88ab321507f73fa029c16aa19ce"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.21/seer_linux_amd64_baseline.tar.gz"
      sha256 "be36a077e64e2c79403876e6d1da11e07c15863779bcab77d1270f880d33108e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.21/seer_linux_arm64.tar.gz"
      sha256 "30cdf60e1cb7fc6987cb1d1b133648f6ee9a93b35ed26fe9bb0dce5c5226e8ff"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
