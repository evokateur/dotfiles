parse_message_arg() {
    commit_message=""
    OPTIND=1

    while getopts ":m:" opt; do
        case "$opt" in
        m)
            if [ -z "$OPTARG" ]; then
                printf 'Error: -m requires a non-empty argument.\n' >&2
                return 1
            fi
            commit_message="$OPTARG"
            ;;
        \?)
            printf 'Usage: %s [-m message] [message]\n' "$0" >&2
            return 2
            ;;
        esac
    done

    shift $((OPTIND - 1)) 2>/dev/null || true

    if [ -z "${commit_message:-}" ] && [ $# -gt 0 ]; then
        commit_message="$*"
    fi

    OPTIND=1
    printf '%s' "$commit_message"
}
