_ensure_keychain() {
    [ -n "$SSH_CONNECTION" ] || return 0
    local kc=~/Library/Keychains/login.keychain-db
    security show-keychain-info "$kc" >/dev/null 2>&1 && return 0
    security unlock-keychain -p "$(pass xkcd/1)" "$kc"
}

claude() { _ensure_keychain && command claude "$@"; }
gh() { _ensure_keychain && command gh "$@"; }
