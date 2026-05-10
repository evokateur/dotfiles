claude() {
    if [ -n "$SSH_CONNECTION" ] && [ -z "$KEYCHAIN_UNLOCKED" ]; then
        security unlock-keychain -p "$(pass xkcd/1)" ~/Library/Keychains/login.keychain-db
        export KEYCHAIN_UNLOCKED=true
    fi
    command claude "$@"
}
