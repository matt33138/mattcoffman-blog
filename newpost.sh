#!/bin/bash

# Usage: ./newpost.sh "My Post Title"

BLOG_DIR="/Users/mattcoffman/Documents/PKM/Core PKM/Blog Posts"
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

# Create the file with frontmatter (draft by default)
cat > "$FILEPATH" << EOF
---
title: "$TITLE"
pubDatetime: $DATETIME
description: ""
draft: true
---

EOF

echo "Created: $FILEPATH"
echo ""
echo "Opening in Obsidian..."
echo ""
echo "When ready to publish:"
echo "  1. Change draft: true → draft: false"
echo "  2. Run: ./publish.sh"

# Open in Obsidian
open "obsidian://open?vault=Core%20PKM&file=Blog%20Posts%2F$DATE-$SLUG"
