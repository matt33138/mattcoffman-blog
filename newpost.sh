#!/bin/bash

# Usage: ./newpost.sh "My Post Title"

BLOG_DIR="$HOME/Documents/MattCoffman.com/mattcoffman-dot-com/src/content/blog"
PROJECT_DIR="$HOME/Documents/MattCoffman.com/mattcoffman-dot-com"

# Get title from argument or prompt
if [ -z "$1" ]; then
    read -p "Post title: " TITLE
else
    TITLE="$1"
fi

# Generate slug from title (lowercase, spaces to hyphens, remove special chars)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

# Today's date
DATE=$(date +%Y-%m-%d)
DATETIME=$(date +%Y-%m-%dT06:00:00Z)

# Full file path
FILEPATH="$BLOG_DIR/$DATE-$SLUG.md"

# Create the file with frontmatter
cat > "$FILEPATH" << EOF
---
title: "$TITLE"
pubDatetime: $DATETIME
description: ""
---

EOF

echo "Created: $FILEPATH"
echo ""
echo "Opening in VS Code... Write your post, then save and close the file."

# Open in VS Code and wait for it to close
code --wait "$FILEPATH"

# After VS Code closes, publish
echo ""
echo "Publishing..."
cd "$PROJECT_DIR"
git add .
git commit -m "New post: $TITLE"
git push

echo ""
echo "✓ Published! Live at https://mattcoffman.com/posts/$DATE-$SLUG/"
