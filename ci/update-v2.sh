#!/bin/bash

# Updates both the coder-cli and coder-cli-nightly formulae to have the given
# values.
# ./update.sh "<version>" "<darwin-arm64-zip-SHA256>" "<darwin-amd64-zip-SHA256>" "<linux-amd64-targz-SHA256>"

set -euo pipefail
cd "$(dirname "$0")"

version="$1"
darwin_arm_sha="$(echo "$2" | tr "[:upper:]" "[:lower:]")"
darwin_intel_sha="$(echo "$3" | tr "[:upper:]" "[:lower:]")"
linux_sha="$(echo "$4" | tr "[:upper:]" "[:lower:]")"

# Replace version
sed -i "s/version \"[0-9.]*\"/version \"$version\"/g" "../Formula/coder.rb"

# Update macOS ARM hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$darwin_arm_sha\"/1" "../Formula/coder.rb"

# Update macOS Intel hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$darwin_intel_sha\"/2" "../Formula/coder.rb"

# Update Linux hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$linux_sha\"/3" "../Formula/coder.rb"
