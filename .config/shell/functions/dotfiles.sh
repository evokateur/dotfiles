dotfiles() {
    if [[ "$1" == "add" ]]; then
        case "$2" in
        .)
            echo "That would add every untracked file in '$PWD' D:"
            echo "You probably meant: 'dotfiles add -u'"
            return 1
            ;;
        -A | --all)
            echo "That would add every untracked file in '$HOME' D:"
            echo "You probably meant: 'dotfiles add -u'"
            return 1
            ;;
        esac
    fi
    /usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}
