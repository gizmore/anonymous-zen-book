#!/usr/bin/env bash
set -euo pipefail

term="${1:-}"
[ -n "$term" ] || { echo "usage: $0 <term>"; exit 2; }

ls -1 | grep -E '^[0-9]+$' | sort -n |
while IFS= read -r f; do
  grep -qi -- "$term" "$f" || continue
  printf '%s\n' "$f"
  cat -- "$f"
  printf '\n\n'
done
