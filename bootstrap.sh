#!/bin/bash
set -e

if [ -d "$HOME/.dotfiles" ]; then
    echo '~/.dotfiles already exists, exiting' >&2
    exit 1
fi

echo "cloning config branch as bare repo to ~/.dotfiles.."
git clone --bare --branch config git@github.com:evokateur/dotfiles.git "$HOME/.dotfiles"

dotfiles() {
    /usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

echo "backing up dotfiles that would be overwritten by initial checkout.."
mkdir -p "$HOME/.dotfiles-backup"
dotfiles checkout 2>&1 | grep -E "^\s+" | awk '{print $1}' | while read -r file; do
    echo "backing up $file to ~/.dotfiles-backup/"
    mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
done

echo "checking out dotfiles into \$HOME.."
dotfiles checkout config

echo "syncing with remote branch and setting upstream to 'origin/config'.."
dotfiles fetch
dotfiles push -u origin config

echo "configuring dotfiles repo to ignore untracked files..."
dotfiles config --local status.showUntrackedFiles no

echo "done"
