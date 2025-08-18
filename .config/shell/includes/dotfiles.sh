dotfiles() {
    if [[ "$1" == "add" && "$2" == "." ]]; then
        echo "❌ Refusing to run 'dotfiles add .' — be specific!"
        return 1
    fi
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
