#!/bin/bash

# Usage: ./publish.sh

OBSIDIAN_BLOG="/Users/mattcoffman/Documents/PKM/Core PKM/Blog Posts"
ASTRO_BLOG="$HOME/Documents/MattCoffman.com/mattcoffman-dot-com/src/data/blog"
PROJECT_DIR="$HOME/Documents/MattCoffman.com/mattcoffman-dot-com"

cd "$PROJECT_DIR"

# Sync from Obsidian to Astro (including deletions)
echo "Syncing from Obsidian..."
rsync -av --delete "$OBSIDIAN_BLOG/" "$ASTRO_BLOG/"

# Check if there are changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to publish - no changes detected."
    exit 0
fi

# Show what's being published
echo ""
echo "Publishing changes:"
git status --short
echo ""

# Commit and push
git add .
git commit -m "Publish $(date +%Y-%m-%d)"
git push

echo ""
echo "✓ Published! Live at https://mattcoffman.com in ~60 seconds."
