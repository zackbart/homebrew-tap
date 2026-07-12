# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.23/seer_darwin_arm64.tar.gz"
      sha256 "5fa2f2b52b9f385aba2f23707587decf1e1827f4990ae2545af5087436c9f567"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.23/seer_darwin_amd64.tar.gz"
      sha256 "c2d0587d85592aa7e3b81843bb5aebf70e1fed83ff27a7c02b986ce5cddf2a75"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.23/seer_linux_amd64_baseline.tar.gz"
      sha256 "789331b9c8f8554aced3aa6aa0f2142dadff755449f63948ce9692648fb8c357"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.23/seer_linux_arm64.tar.gz"
      sha256 "fb7fbfef4d38d7171fef97976e845c75bffdbd0a2b9cfae7a171828ebf7cabde"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
