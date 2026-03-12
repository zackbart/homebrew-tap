# typed: false
# frozen_string_literal: true

class Cleenup < Formula
  desc "Scan Claude Code and Codex CLI session logs for leaked secrets"
  homepage "https://github.com/zackbart/cleenup"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.0/cleenup_0.1.0_darwin_amd64.tar.gz"
      sha256 "869eac6626b8937f4d7da0c6611cc69ebc1d962ebced898827bdc574714bc9fb"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.0/cleenup_0.1.0_darwin_arm64.tar.gz"
      sha256 "db95d54350b0e70ff5112e0fbd795fa599caa27b588c94ab3c2f12451216e856"

      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.0/cleenup_0.1.0_linux_amd64.tar.gz"
      sha256 "e896020399804cd36efcda8d6b2b456d38599ca1c1b8d9c8587babdc95ae7e65"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zackbart/cleenup/releases/download/v0.1.0/cleenup_0.1.0_linux_arm64.tar.gz"
      sha256 "5dc42b62c4988f7e5a56c9a51a412c13d8efc4b9b4c4ad3931d32729fd15cbd4"
      define_method(:install) do
        bin.install "cleenup"
      end
    end
  end

  test do
    assert_match "Scan Claude Code and Codex logs", shell_output("#{bin}/cleenup --help")
  end
end
