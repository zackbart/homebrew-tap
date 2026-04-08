# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.7/seer_darwin_arm64.tar.gz"
      sha256 "c495254d4cd517c3719a50f80056edbf4ae4f57b49c1255c4babf5762350fbad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.7/seer_darwin_amd64.tar.gz"
      sha256 "9dbf801f060ddb0d20af175d4abd1fa06044d192ebe020a38a89abcfecc49cf1"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.7/seer_linux_amd64_baseline.tar.gz"
      sha256 "c6e4c65943d6c87f676ef6ba99e5e9be19c74af5e7ffd2a49059c787a65c53f2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.7/seer_linux_arm64.tar.gz"
      sha256 "126142ae1f132e0f19d41aeb6cb9d0d6b1abbfc31d9a7b7feecbf6b23faabdb5"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
