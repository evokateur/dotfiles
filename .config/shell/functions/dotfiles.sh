dotfiles() {
    if [[ "$1" == "add" ]]; then
        case "$2" in
        . | -A | --all)
            echo "That would add every untracked file in your home directory! D:"
            echo "You probably meant: 'dotfiles add -u'"
            return 1
            ;;
        esac
    fi
    /usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}
