# typed: false
# frozen_string_literal: true

class Seer < Formula
  desc "A TUI file browser with live preview"
  homepage "https://github.com/zackbart/seer"
  version "1.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/seer/releases/download/v1.0.6/seer_darwin_arm64.tar.gz"
      sha256 "bb11b968f805876122fd25343e0e3ac64a4ec6748d867b8574bc36a5d2824348"
    end
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/seer/releases/download/v1.0.6/seer_darwin_amd64.tar.gz"
      sha256 "a36fcf0fa31f90201e02c5225da7f3db603286e6bbb08fa479dbdd8b35b07ccb"
    end
  end

  on_linux do
    # amd64 uses the baseline Bun build so it runs on any x86-64
    # CPU (including VMs / older servers without AVX2). See
    # release.yml for rationale.
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.6/seer_linux_amd64_baseline.tar.gz"
      sha256 "b422688c7c5ba7d7f17800a828e379003e2175ddd7852fb3be1920365d0cfbc6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/seer/releases/download/v1.0.6/seer_linux_arm64.tar.gz"
      sha256 "d6bff875ce7530a4100b7c990e56debb0f679e99ab6d519b40b1d898fd946fa4"
    end
  end

  def install
    bin.install "seer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seer --version")
  end
end
