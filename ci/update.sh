#!/bin/bash

# Updates both the coder-cli and coder-cli-nightly formulae to have the given
# values.
# ./update.sh "<version>" "<darwin-amd64-zip-SHA256>" "<linux-amd64-targz-SHA256>"

set -euo pipefail
cd "$(dirname "$0")"

version="$1"
darwin_sha="$(echo "$2" | tr "[:upper:]" "[:lower:]")"
linux_sha="$(echo "$3" | tr "[:upper:]" "[:lower:]")"

# Get the old version to use in our find/replace.
old_version="$(sed -n "s/.*version \"\(.*\)\".*/\1/p" ../coder-cli.rb)"
if [[ "$old_version" == "" ]]; then
  echo "Could not determine the old version of the formula..." >&2
  exit 1
fi

# Replace version
sed -i "s/${old_version//./\.}/${version//./\.}/g" ../coder-cli{,-nightly}.rb

# Darwin amd64 SHA256. This only selects the first match
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$darwin_sha\"/1" ../coder-cli{,-nightly}.rb

# Linux amd64 SHA256. This only selects the second match
sed -zi "s/sha256 \"[a-f0-9]*\"/sha256 \"$linux_sha\"/2" ../coder-cli{,-nightly}.rb