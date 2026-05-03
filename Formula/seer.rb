# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.20/seer_darwin_arm64.tar.gz"
      sha256 "c693f957095c103f7f67e249a5cf0a047bbf996b9f8183a99b8e17a34b5bd537"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.20/seer_darwin_amd64.tar.gz"
      sha256 "2c986109f65b19a66c74a6987738d56fa9932e6efa7ec90bf10a4383d9734830"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.20/seer_linux_amd64_baseline.tar.gz"
      sha256 "930a617a999606ab8d0f716e932a6eeaa1e52c11f6bdcb038a6c6a4dd8ab3a6a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.20/seer_linux_arm64.tar.gz"
      sha256 "95f132404e73f1c1b26ca78b9b3230f170c2cc8105267a133473499dee9c15b1"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
