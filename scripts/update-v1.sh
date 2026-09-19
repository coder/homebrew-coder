#!/bin/bash

# Updates the coder@1 formula
# ./update.sh "<version>" "<darwin-amd64-zip-SHA256>" "<linux-amd64-targz-SHA256>"

set -euo pipefail
cd "$(dirname "$0")"

version="$1"
darwin_sha="$(echo "$2" | tr "[:upper:]" "[:lower:]")"
linux_sha="$(echo "$3" | tr "[:upper:]" "[:lower:]")"

# Replace version in the download URLs (Homebrew detects the version from them)
sed -Ei "s#(releases/download/v)[0-9.]+(/coder-cli-)#\1${version}\2#g" "../Formula/coder@1.rb"

# Fail loudly if any of the 2 URLs was not updated
if [ "$(grep -cF "releases/download/v${version}/coder-cli-" "../Formula/coder@1.rb")" -ne 2 ]; then
  echo "Expected 2 download URLs for ${version} in Formula/coder@1.rb" >&2
  exit 1
fi

# Update macOS hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"${darwin_sha}\"/1" "../Formula/coder@1.rb"

# Update Linux hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"${linux_sha}\"/2" "../Formula/coder@1.rb"
