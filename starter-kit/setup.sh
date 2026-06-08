#!/usr/bin/env bash
#
# JobFlow setup (macOS / Linux) — copies this starter kit into a fresh working folder.
#
# Usage:
#   ./setup.sh                  # creates ./JobFlow
#   ./setup.sh ~/Docs/JobFlow   # creates it at the path you give
#
# Run this from inside the unzipped JobFlow starter kit. It will not overwrite an
# existing folder, so your data is safe.

set -euo pipefail

TARGET="${1:-JobFlow}"
KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[ -d "$KIT/Prompts" ] || { echo "Error: run this from inside the unzipped JobFlow starter kit (no Prompts/ found)." >&2; exit 1; }
[ -e "$TARGET" ] && { echo "Error: '$TARGET' already exists. Choose a new path so existing data isn't touched." >&2; exit 1; }

mkdir -p "$TARGET"

for item in "$KIT"/*; do
  base="$(basename "$item")"
  case "$base" in setup.ps1|setup.sh) continue ;; esac
  cp -R "$item" "$TARGET/"
done

echo ""
echo "JobFlow is ready at: $TARGET"
echo "Next:"
echo "  1. Open $TARGET/START-HERE.md"
echo "  2. Drop your resumes / writing samples / project docs into $TARGET/Seed/"
echo "  3. Paste $TARGET/Prompts/orchestrator.md into your AI assistant"
