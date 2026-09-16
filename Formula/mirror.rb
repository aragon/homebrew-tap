# This file is regenerated on every tag release by
# aragon/evm-mirror → .github/workflows/mirror.yaml → publish-homebrew.
# Do not edit by hand — changes will be overwritten.

class Mirror < Formula
  desc "Verify on-chain EVM contract source against a local snapshot"
  homepage "https://github.com/aragon/evm-mirror"
  version "0.15.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.15.0/mirror-macos-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.15.0/mirror-macos-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.15.0/mirror-linux-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.15.0/mirror-linux-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "mirror"
  end

  test do
    assert_match "Mirror", shell_output("#{bin}/mirror --version")
  end
end
