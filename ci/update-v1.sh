#!/bin/bash

# Updates the coder@1 formula
# ./update.sh "<version>" "<darwin-amd64-zip-SHA256>" "<linux-amd64-targz-SHA256>"

set -euo pipefail
cd "$(dirname "$0")"

version="$1"
darwin_sha="$(echo "$2" | tr "[:upper:]" "[:lower:]")"
linux_sha="$(echo "$3" | tr "[:upper:]" "[:lower:]")"

# Replace version
sed -i "s/version \"[0-9.]*\"/version \"$version\"/g" "../Formula/coder@1.rb"

# Update macOS hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$darwin_sha\"/1" "../Formula/coder@1.rb"

# Update Linux hash
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$linux_sha\"/2" "../Formula/coder@1.rb"
