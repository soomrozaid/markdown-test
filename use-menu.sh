#!/bin/bash

# Example script showing how to reuse commit-helper.sh's menu functions.
# Place this file next to commit-helper.sh and run it.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/commit-helper.sh"

# Provide your own options
MY_OPTIONS=("Stage all" "Run tests" "Lint" "Create commit message")

echo "Starting reusable menu from use-menu.sh"
# Capture newline-separated output into an array safely
mapfile -t selected < <(run_menu "${MY_OPTIONS[@]}")

echo
echo "Selected items (count: ${#selected[@]}):"
for item in "${selected[@]}"; do
  echo "- ${item}"
done
    
exit 0
