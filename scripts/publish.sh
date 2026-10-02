#!/usr/bin/env bash
# Copy one slide deck into this repository as a self-contained folder.
# Usage: scripts/publish.sh <deck.html> <slug> [deck.pdf]
# The deck's own "assets/..." references are copied next to it, so the
# folder works on its own. Nothing is committed or pushed here.
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "usage: scripts/publish.sh <deck.html> <slug> [deck.pdf]" >&2
  exit 2
fi

src="$1"; slug="$2"; pdf="${3:-}"
root="$(cd "$(dirname "$0")/.." && pwd)"
srcdir="$(cd "$(dirname "$src")" && pwd)"
dest="$root/$slug"

mkdir -p "$dest"
cp "$src" "$dest/index.html"

grep -o 'assets/[A-Za-z0-9_./-]*' "$src" | sort -u | while read -r asset; do
  if [ -f "$srcdir/$asset" ]; then
    mkdir -p "$dest/$(dirname "$asset")"
    cp "$srcdir/$asset" "$dest/$asset"
  else
    echo "missing asset: $asset" >&2
  fi
done

if [ -n "$pdf" ]; then
  cp "$pdf" "$dest/$slug.pdf"
fi

echo "copied to $dest"
git -C "$root" status --short "$slug"
