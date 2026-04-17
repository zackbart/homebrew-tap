# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.16/seer_darwin_arm64.tar.gz"
      sha256 "5db88bbd56e66e09d65b2752327536195e8b7c621e89a72bfcf60df0a10a1c0e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.16/seer_darwin_amd64.tar.gz"
      sha256 "a5c0a79ef058284a663af2d360a893440a46914614e848183936306b7d10adc9"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.16/seer_linux_amd64_baseline.tar.gz"
      sha256 "2092c752d75abda458220cf53625f9af5f9ee5edb179e74af90f5e46e6f87a57"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.16/seer_linux_arm64.tar.gz"
      sha256 "4ffdaebbbfa7eab4709a804cfa590c057440cfc79d111613999d6cc78ec97783"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
