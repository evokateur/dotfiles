#!/bin/bash
set -e

echo "🔍 Backing up any pre-existing dotfiles that would be overwritten..."
mkdir -p "$HOME/.dotfiles-backup"

dotfiles checkout 2>&1 | grep -E "^\s+" | awk '{print $1}' | while read -r file; do
  echo "⚠️  Backing up $file to ~/.dotfiles-backup/"
  mkdir -p "$(dirname "$HOME/.dotfiles-backup/$file")"
  mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
done

echo "📦 Checking out dotfiles into \$HOME..."
dotfiles checkout || {
  echo "❌ Checkout failed even after backup. Manual conflict resolution needed."
  exit 1
}

echo "🔁 Sync complete!"
