#!/bin/bash
set -e

OBSIDIAN_DIR="/Users/chhunly/Documents/obsidians/harrythoughts/Books I've read"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "→ Copying content from Obsidian..."
rm -rf "$REPO_DIR/content"
cp -r "$OBSIDIAN_DIR" "$REPO_DIR/content"

echo "→ Copying assets..."
rm -rf "$REPO_DIR/static/_assets"
mkdir -p "$REPO_DIR/static/_assets"
cp -r "$OBSIDIAN_DIR/_assets/." "$REPO_DIR/static/_assets/"

echo "→ Building Hugo..."
cd "$REPO_DIR"
hugo

echo "→ Committing..."
git add .
git commit -m "update: $(date '+%Y-%m-%d %H:%M')"

echo "→ Pushing to GitHub..."
git push

echo "✓ Done! Vercel will auto-deploy."
