#!/bin/bash

# Usage: ./newpost.sh "My Post Title" [YYYY-MM-DD]
# If no date provided, defaults to today

BLOG_DIR="/Users/mattcoffman/Documents/PKM/Core PKM/Blog Posts"
PROJECT_DIR="$HOME/Documents/MattCoffman.com/mattcoffman-dot-com"

# Get title from argument or prompt
if [ -z "$1" ]; then
    read -p "Post title: " TITLE
else
    TITLE="$1"
fi

# Get date from second argument or use today
if [ -z "$2" ]; then
    DATE=$(date +%Y-%m-%d)
else
    DATE="$2"
fi

DATETIME="${DATE}T06:00:00Z"

# Generate slug from title (lowercase, spaces to hyphens, remove special chars)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

# Full file path
FILEPATH="$BLOG_DIR/$DATE-$SLUG.md"

# Create the file with frontmatter (draft by default)
cat > "$FILEPATH" << EOF
---
title: "$TITLE"
pubDatetime: $DATETIME
draft: true
---

EOF

echo "Created: $FILEPATH"
echo "Publish date: $DATE"
echo ""
echo "Opening in Obsidian..."
echo ""
echo "When ready to publish:"
echo "  1. Change draft: true → draft: false"
echo "  2. Run: ./publish.sh"

# Open in Obsidian
open "obsidian://open?vault=Core%20PKM&file=Blog%20Posts%2F$DATE-$SLUG"
