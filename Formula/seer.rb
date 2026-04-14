# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.13/seer_darwin_arm64.tar.gz"
      sha256 "504e6292dec1270fea14e0e79945ff3c0ef43e8007e6965b5efc3b6392faed4c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.13/seer_darwin_amd64.tar.gz"
      sha256 "bab5b30e8dd5885e80e107e5553f857a3da1c291a39b47d3d08834a0efd89b1c"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.13/seer_linux_amd64_baseline.tar.gz"
      sha256 "7821d1c42d944865c56d73df61d1fa1241a002ab88766f43f0695ad297235d10"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.13/seer_linux_arm64.tar.gz"
      sha256 "08db9b70af48f884886a2aa2a43065a556b1462fd090447eb8fdd44a2e645552"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
