# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.18/seer_darwin_arm64.tar.gz"
      sha256 "e42f08bac58b81568f97f420839d64a2313200d9d0d262b92270fdad6e8498de"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.18/seer_darwin_amd64.tar.gz"
      sha256 "f288765f4a6228b44dd134c7c2a4f0a2c4302063a7499231cf225d7dc1b92729"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.18/seer_linux_amd64_baseline.tar.gz"
      sha256 "582e8928ab888694fd78466fa3d82eaf4a7db97d95b2fc407343af3c9c496c3b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.18/seer_linux_arm64.tar.gz"
      sha256 "e97fe98135572ddc737a01b71eb734e541c1e8e59c46ed175960ccb211a09e49"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
