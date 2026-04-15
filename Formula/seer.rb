# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.14/seer_darwin_arm64.tar.gz"
      sha256 "d8ae182b05c3076ff8befcd3c0ece11f0092c2af989feec7e015c79b22713861"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.14/seer_darwin_amd64.tar.gz"
      sha256 "9e05648df9afe4ab3ce121e1544a073c0a46c5aa9e189db1ae0dcdc48c3193ff"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.14/seer_linux_amd64_baseline.tar.gz"
      sha256 "c0c989f8155dc263db173956bebd73a911840dcd24d5e9f44dbc8216e0c97c98"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.14/seer_linux_arm64.tar.gz"
      sha256 "e55c3cc04724f0aae1f9ee1f6437136457cde8264d068787356d2a73c024caf7"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
