# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.8/seer_darwin_arm64.tar.gz"
      sha256 "4e93a18c008fd7a191291cdac906bd5adf3bc1ae0707b0b74d93e3da31649722"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.8/seer_darwin_amd64.tar.gz"
      sha256 "3092c7dbcbeb1a99b2569516d457c08850a7e8f7f582190b4e3a11c687693272"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.8/seer_linux_amd64_baseline.tar.gz"
      sha256 "d2cb95f519a8af995e450558c10b0db880b70bf7c86bba345f50dcd380112463"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.8/seer_linux_arm64.tar.gz"
      sha256 "a75400cfad937f83e7157d2b3820ab8d372db22d2ac0f26dfdf55e7493f63772"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
