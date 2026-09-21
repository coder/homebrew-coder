You are an experienced, pragmatic software engineering AI agent. Do not over-engineer a solution when a simple one is possible. Keep edits minimal. If you want an exception to ANY rule, you MUST stop and get permission first.

# Project Overview

This repository is the **official Homebrew tap** for Coder. It contains Homebrew **formulae** (CLI tools) and **casks** (macOS packages) used by end-users via `brew install`.

- **Primary tech:** Homebrew Formula/Cask DSL (Ruby).
- **Other tech:** Bash helper scripts under `scripts/`.
- **CI:** GitHub Actions runs `brew test-bot` (see `.github/workflows/test.yml`).

Typical changes are version bumps (updating `version`, `url`, and `sha256`) and keeping tests/install stanzas aligned with Homebrew conventions.

# Reference

## Key directories

- `Formula/`: Homebrew formulae (Ruby classes).
- `Casks/`: Homebrew casks (Ruby DSL blocks).
- `scripts/`: helper scripts for updating formula versions/hashes.
- `.github/workflows/`: CI definition.

## Key files

- `Formula/coder.rb`: **Coder v2** CLI formula (macOS arm64/amd64 + Linux amd64).
- `Casks/coder-desktop.rb`: Coder Desktop (versioned pkg + pinned `sha256`).
- `Casks/coder-desktop-preview.rb`: Deprecated preview cask (`sha256 :no_check`).
- `scripts/update-v2.sh`: Updates `Formula/coder.rb` for a new v2 release.

# Essential commands

> Prerequisite: most commands below require **Homebrew** (`brew`) to be installed.

## Build

- N/A: this is a tap repository (no compilation/build step in-repo).

## Format

- Format/style formulae & casks (Homebrew style checks):
  ```sh
  brew style
  ```

## Lint

- Tap syntax checks (matches CI):
  ```sh
  brew test-bot --only-tap-syntax
  ```

## Test

- Run the same test phase CI runs for pull requests:
  ```sh
  brew test-bot --only-formulae
  ```

> Note: `brew test-bot` is relatively heavy but is the most reliable way to match CI behavior for this repo.

## Clean

- CI cleanup phase (useful locally when iterating with `brew test-bot`):
  ```sh
  brew test-bot --only-cleanup-before
  ```

- CI setup phase (often needed after cleanup / on first run):
  ```sh
  brew test-bot --only-setup
  ```

## Development server

- N/A.

## Release/update helpers

> Note: `scripts/update-v2.sh` uses GNU `sed` flags (`-z` and `-i` without a backup extension). It’s expected to run in a GNU `sed` environment (e.g., Linux). If you’re on macOS with BSD `sed`, run them in a Linux container or adjust the commands.

- Update **Coder v2** formula (`Formula/coder.rb`):
  ```sh
  ./scripts/update-v2.sh "<version>" "<darwin-arm64-sha256>" "<darwin-amd64-sha256>" "<linux-amd64-sha256>"
  ```

- Computing SHA256 for downloaded artifacts:
  ```sh
  # macOS
  shasum -a 256 <file>

  # Linux
  sha256sum <file>
  ```

# Patterns

## Version bumps (formulae)

- There is no `version` stanza; Homebrew scans the version from the download URLs. A bump rewrites the version in every `url` line, and `scripts/update-v2.sh` fails if it does not end up with all three.
- For `Formula/coder.rb`, there are **three** `sha256` entries (macOS arm64, macOS amd64, Linux amd64).
  - `scripts/update-v2.sh` replaces the **1st/2nd/3rd** `sha256` occurrence; avoid reordering or inserting extra `sha256` lines without updating `scripts/update-v2.sh`.
- Prefer **deterministic** `test do` blocks (fast, no external state). If tests must fail, use `shell_output(cmd, expected_exit_code)` like `Formula/coder.rb`.

## Version bumps (casks)

- Use a pinned `sha256` when the URL is versioned.
- Use `sha256 :no_check` only when the URL is intentionally unversioned (as in the deprecated preview cask).

# Anti-patterns

- Don’t reorder `sha256` lines in formulae if you still rely on `scripts/update-v2.sh` (it patches by “nth match”).
- Don’t add network-dependent tests or long-running integration tests to formulae; Homebrew formula tests should be quick and reproducible.

# Commit and Pull Request Guidelines

## Before committing

- Run at least:
  ```sh
  brew test-bot --only-tap-syntax
  ```
- If you changed formulae, also run:
  ```sh
  brew test-bot --only-formulae
  ```

## Commit messages

Recent history uses concise, release-oriented subjects. Prefer:

- `coder <version>` for `Formula/coder.rb` bumps (example: `coder 2.30.0`).
- `Coder Desktop v<version>` for cask releases.

## Pull requests

In the PR description:

- State **what changed** (which formula/cask + version).
- Include **where the SHA256 values came from** (e.g., the upstream release artifacts you downloaded).
- Include **what you ran** locally (or say “not run” if you couldn’t).
