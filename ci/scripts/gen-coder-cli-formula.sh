#!/bin/bash

set -eu

cd "$(dirname "$0")"
cd "$(git rev-parse --show-toplevel)"

version="$1"

sha() {
  sha256sum | awk '{ print $1 }'
}

linux_url="https://github.com/cdr/coder-cli/releases/download/v$version/coder-cli-linux-amd64.tar.gz"
macos_url="https://github.com/cdr/coder-cli/releases/download/v$version/coder-cli-darwin-amd64.zip"

linux_sha="$(curl -sL "$linux_url" | sha)"
macos_sha="$(curl -sL "$macos_url" | sha)"
template=$(cat ./ci/templates/coder-cli.rb)

template="${template//\{\{MACOS_SHA\}\}/$macos_sha}"
template="${template//\{\{LINUX_SHA\}\}/$linux_sha}"

template="${template//\{\{MACOS_URL\}\}/$macos_url}"
template="${template//\{\{LINUX_URL\}\}/$linux_url}"

template="${template//\{\{VERSION\}\}/$version}"

echo "$template" > ./coder-cli.rb
