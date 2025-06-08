#!/bin/bash
set -e

echo "🔧 Cloning dotfiles repo as bare Git repo..."
git clone --bare git@github.com:evokateur/dotfiles.git $HOME/.dotfiles

function dotfiles {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

echo "🔍 Backing up any pre-existing dotfiles that would be overwritten..."
mkdir -p $HOME/.dotfiles-backup
dotfiles checkout 2>&1 | grep -E "^\s+" | awk '{print $1}' | while read -r file; do
    echo "⚠️  Backing up $file to ~/.dotfiles-backup/"
    mkdir -p "$(dirname "$HOME/.dotfiles-backup/$file")"
    mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
done

echo "📦 Checking out dotfiles into \$HOME..."
dotfiles checkout

echo "✅ Configuring dotfiles repo to ignore untracked files..."
dotfiles config --local status.showUntrackedFiles no

echo "🎉 Dotfiles setup complete!"
