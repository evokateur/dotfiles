#!/bin/bash
set -e

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "📥 Cloning dotfiles config branch as a bare repo..."
    git clone --bare --branch config git@github.com:yourname/dotfiles.git "$HOME/.dotfiles"
else
    echo "✅ Dotfiles repo already exists at ~/.dotfiles"
fi

dotfiles() {
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME "$@"
}

echo "🔍 Backing up any pre-existing dotfiles that would be overwritten..."
mkdir -p $HOME/.dotfiles-backup
dotfiles checkout 2>&1 | grep -E "^\s+" | awk '{print $1}' | while read -r file; do
    echo "⚠️  Backing up $file to ~/.dotfiles-backup/"
    mkdir -p "$(dirname "$HOME/.dotfiles-backup/$file")"
    if [ ! -e "$HOME/.dotfiles-backup/$file" ]; then
        echo "⚠️  Backing up $file to ~/.dotfiles-backup/"
        mkdir -p "$(dirname "$HOME/.dotfiles-backup/$file")"
        mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
    else
        echo "♻️  Backup already exists for $file — skipping"
    fi
done

echo "📦 Checking out dotfiles into \$HOME..."
dotfiles checkout config

echo "🔄 Syncing with remote branch and setting upstream to 'origin/config'..."
dotfiles fetch
dotfiles push -u origin config

echo "✅ Configuring dotfiles repo to ignore untracked files..."
dotfiles config --local status.showUntrackedFiles no

echo "🎉 Dotfiles setup complete!"
