# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.9/seer_darwin_arm64.tar.gz"
      sha256 "3923898ff7a6f672cc3d3a0a0907f21d31bf301b69f29c9181e4170b670f1d5c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.9/seer_darwin_amd64.tar.gz"
      sha256 "7942e292b7417d017159a1b68a5309cfa24c128123fdc9d4befef852ed8a1377"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.9/seer_linux_amd64_baseline.tar.gz"
      sha256 "71871eaa7cd802146a3bff40ef36e67a542becfd66d2a3ac56bcae64dce7b9b9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.9/seer_linux_arm64.tar.gz"
      sha256 "e3d7dfa0e2695109f447ab9bfa41513860f873c87c91945157d9bc05b4be9034"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
