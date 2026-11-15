#!/bin/sh
set -eu

cd "$(dirname "$0")/.."
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT HUP INT TERM
base=https://github.com/Fail-Safe/Noema/releases/latest/download
status=$(curl --silent --show-error --location --output "$work/install.sh" \
  --write-out '%{http_code}' "$base/install.sh")
if [ "$status" = 404 ]; then
  echo '::warning::Latest Noema release has no install.sh; continuing without it'
  exit 0
fi
if [ "$status" != 200 ]; then
  echo "Failed to download install.sh (HTTP $status)" >&2
  exit 1
fi
curl --fail --silent --show-error --location "$base/checksums.txt" \
  --output "$work/checksums.txt"
# Check only the installer; platform archives are not downloaded here.
awk '$2 == "install.sh" || $2 == "*install.sh" { print }' \
  "$work/checksums.txt" > "$work/install.sha256"
if [ "$(wc -l < "$work/install.sha256" | tr -d ' ')" != 1 ]; then
  echo 'Expected exactly one install.sh checksum' >&2
  exit 1
fi
(cd "$work" && shasum -a 256 -c install.sha256)
mkdir -p public
mv "$work/install.sh" public/install.sh
