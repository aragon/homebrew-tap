# This file is regenerated on every tag release by
# aragon/evm-mirror → .github/workflows/ci.yaml → publish-homebrew.
# Do not edit by hand — changes will be overwritten.

class Mirror < Formula
  desc "Verify on-chain EVM contract source against a local snapshot"
  homepage "https://github.com/aragon/evm-mirror"
  version "0.16.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.16.0/mirror-macos-aarch64.tar.gz"
      sha256 "1e4bd6384697174e819ccad10ba2ab36adb333c720afe1eedf8e4c579a840b03"
    end
    on_intel do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.16.0/mirror-macos-x86_64.tar.gz"
      sha256 "7a1636210c1e79e3917842a20b48d89e3ad5f36ba4edd57c981434111f972f37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.16.0/mirror-linux-aarch64.tar.gz"
      sha256 "0064585dd1b6dab38e61268b4fa421b8a6793355e649e0def850d70e95f4be9f"
    end
    on_intel do
      url "https://github.com/aragon/evm-mirror/releases/download/v0.16.0/mirror-linux-x86_64.tar.gz"
      sha256 "220c12176fde3add402114fcdd47a2f1bfa6b806a7168e3478c6d06b0e6352cd"
    end
  end

  def install
    bin.install "mirror"
  end

  test do
    assert_match "Mirror", shell_output("#{bin}/mirror --version")
  end
end
