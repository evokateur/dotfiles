dotfiles() {
    if [[ "$1" == "add" && "$2" == "." ]]; then
        echo "That would add everything in your home directory! D:"
        echo "You probably mean: 'dotfiles add -u'.."
        # 'dotfiles add -u' will add only tracked files that are modified or deleted.
        return 1
    fi
    /usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}
