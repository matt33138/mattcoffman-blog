#!/bin/bash

# Usage: ./publish.sh

PROJECT_DIR="$HOME/Documents/MattCoffman.com/mattcoffman-dot-com"

cd "$PROJECT_DIR"

# Check if there are changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to publish - no changes detected."
    exit 0
fi

# Show what's being published
echo "Publishing changes:"
git status --short
echo ""

# Commit and push
git add .
git commit -m "Publish $(date +%Y-%m-%d)"
git push

echo ""
echo "✓ Published! Live at https://mattcoffman.com in ~60 seconds."
