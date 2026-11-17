claude() {
    if [ -n "$SSH_CONNECTION" ]; then
        local kc=~/Library/Keychains/login.keychain-db
        security show-keychain-info "$kc" >/dev/null 2>&1 ||
            security unlock-keychain -p "$(pass xkcd/1)" "$kc" || return 1
    fi
    command claude "$@"
}
