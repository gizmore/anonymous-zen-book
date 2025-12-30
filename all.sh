#!/bin/bash
ls -1A | grep -E '^[0-9]+$' | sort -n |
while IFS= read -r f; do
  [ -f "$f" ] || continue
  printf '==> %s <==\n' "$f"
  cat -- "$f"
  printf '\n\n'
done
