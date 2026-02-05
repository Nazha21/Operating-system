#!/bin/bash
# Adds OLD_ prefix to all .txt files in current directory

shopt -s nullglob
for f in *.txt; do
  if [[ "$f" != OLD_* ]]; then
    mv -- "$f" "OLD_$f"
  fi
done
echo "Done renaming .txt files."
