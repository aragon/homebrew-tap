# homebrew-tap

[Homebrew tap](https://docs.brew.sh/Taps) for CLIs published by
[Aragon](https://github.com/aragon).

## Install

```sh
brew tap aragon/tap
brew install <formula>
```

Homebrew's naming rule is only about the repo prefix (`homebrew-<name>`), so
`aragon/homebrew-tap` is discovered as `aragon/tap`.

To upgrade later:

```sh
brew update
brew upgrade <formula>
```

## Formulae

| Formula  | Description                                                | Source                                                            |
| -------- | ---------------------------------------------------------- | ----------------------------------------------------------------- |
| `mirror` | Verify on-chain EVM contract source against a local repo   | [aragon/evm-mirror](https://github.com/aragon/evm-mirror)         |

New formulae are added by their source repo's release workflow — see below.

## How the formulae are updated

Files in `Formula/` are **auto-generated on every source-repo release**. Do not
edit them by hand — the next release will overwrite the change.

For `mirror`, the generator is
[`scripts/render-homebrew-formula.sh`](https://github.com/aragon/evm-mirror/blob/main/scripts/render-homebrew-formula.sh)
in the `evm-mirror` repo. On every `v*` tag push, its
[`publish-homebrew`](https://github.com/aragon/evm-mirror/blob/main/.github/workflows/mirror.yaml)
job:

1. Checks out this repo using a `HOMEBREW_TAP_TOKEN` PAT.
2. Downloads each release asset from `aragon/evm-mirror` and computes its
   `sha256`.
3. Writes `Formula/mirror.rb` with the new version + URLs + SHAs.
4. Commits and pushes back here.

The render script fails hard if any release asset is missing, so a broken
release never publishes a broken formula.

## Adding a new formula

To onboard another CLI (say `aragon/some-other-tool`) into this tap:

1. In that tool's repo, add its own `scripts/render-homebrew-formula.sh` (crib
   from `evm-mirror`) that writes `Formula/<name>.rb` into an `OUT_DIR`
   checkout.
2. Add a `publish-homebrew` job to its release workflow that checks this repo
   out with `HOMEBREW_TAP_TOKEN`, runs the render script with `OUT_DIR=tap`,
   and commits `Formula/<name>.rb` back here.
3. Grant that PAT `contents: write` on this repo.
4. Add a row to the **Formulae** table above.

Keeping the renderer in each source repo means every project owns its own
build/asset knowledge; this tap repo just stores the finished formulae.
