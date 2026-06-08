# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.22/seer_darwin_arm64.tar.gz"
      sha256 "ca17c464164baafcb10150572ab30e55513fce5df527546b808fddbfea2e5303"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.22/seer_darwin_amd64.tar.gz"
      sha256 "24c8dc9980f5a21bfe6cde2a92e3951bb04f0c7e4a2cf8047f1455bd62b1ccd7"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.22/seer_linux_amd64_baseline.tar.gz"
      sha256 "853aaef820ab6d03771423a5677d660f396fc3584d384a2c070b3314540e0291"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.22/seer_linux_arm64.tar.gz"
      sha256 "3b176c81b0aa55863dc595db8c57b8571fd3a6ba42ad0648c8a720daa69e7ec9"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
