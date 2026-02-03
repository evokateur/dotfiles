dotfiles() {
    if [[ "$1" == "add" && "$2" == "." ]]; then
        echo "Refusing to add everything in your home directory."
        echo "You probably meant to run 'dotfiles add -u'.."
        # 'dotfiles add -u' will add only tracked files that are modified or deleted.
        return 1
    fi
    /usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}
