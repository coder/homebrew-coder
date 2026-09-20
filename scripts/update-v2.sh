#!/bin/bash

# Updates the coder formula
# ./update.sh "<version>" "<darwin-arm64-zip-SHA256>" "<darwin-amd64-zip-SHA256>" "<linux-amd64-targz-SHA256>"

set -euo pipefail
cd "$(dirname "$0")"

version="$1"
darwin_arm_sha="$(echo "$2" | tr "[:upper:]" "[:lower:]")"
darwin_intel_sha="$(echo "$3" | tr "[:upper:]" "[:lower:]")"
linux_sha="$(echo "$4" | tr "[:upper:]" "[:lower:]")"

# Replace version in the download URLs (Homebrew detects the version from them)
sed -Ei "s#(releases/download/v)[0-9.]+/coder_[0-9.]+_#\1${version}/coder_${version}_#g" "../Formula/coder.rb"

# Fail loudly if any of the 3 URLs was not updated
url_count="$(grep -cF "releases/download/v${version}/coder_${version}_" "../Formula/coder.rb")"
if [[ "${url_count}" -ne 3 ]]
then
  echo "Expected 3 download URLs for ${version} in Formula/coder.rb" >&2
  exit 1
fi

# Update macOS ARM hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"${darwin_arm_sha}\"/1" "../Formula/coder.rb"

# Update macOS Intel hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"${darwin_intel_sha}\"/2" "../Formula/coder.rb"

# Update Linux hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"${linux_sha}\"/3" "../Formula/coder.rb"
