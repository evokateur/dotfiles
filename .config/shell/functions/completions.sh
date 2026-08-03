cache_dir="$HOME/.cache/completions"
mkdir -p -- "$cache_dir"

if [[ "$OSTYPE" == darwin* ]]; then
    stat_mtime() { stat -f %m "$1" 2>/dev/null; }
else
    stat_mtime() { stat -c %Y "$1" 2>/dev/null; }
fi

source_cached() {
    local cmd="$1"
    shift
    local exe_path

    exe_path="$(command -v -- "$cmd" 2>/dev/null)" || exe_path="$cmd"
    exe_path="${exe_path:A}"

    local cache_file="$cache_dir/${cmd}.sh"
    local regenerate=0

    if [ ! -f "$cache_file" ]; then
        regenerate=1
    else
        if [ -x "$exe_path" ] || [ -f "$exe_path" ]; then
            local exe_mtime cache_mtime
            exe_mtime=$(stat_mtime "$exe_path" 2>/dev/null || echo 0)
            cache_mtime=$(stat_mtime "$cache_file" 2>/dev/null || echo 0)
            if [ "$exe_mtime" -gt "$cache_mtime" ]; then
                regenerate=1
            fi
        fi
    fi

    if [ "$regenerate" -eq 1 ]; then
        local tmp old_umask
        tmp=$(mktemp "${cache_file}.XXXXXX" 2>/dev/null) || tmp=$(mktemp -t "${cmd}" 2>/dev/null)
        old_umask=$(umask)
        umask 077
        if ! "$cmd" "$@" >"$tmp"; then
            rm -f -- "$tmp"
            umask "$old_umask"
            return 1
        fi
        mv -f -- "$tmp" "$cache_file"
        umask "$old_umask"
    fi

    # shellcheck source=/dev/null
    # shellcheck disable=SC1090
    source "$cache_file"
}

if command -v hrvst >/dev/null 2>&1; then
    source_cached hrvst completion
fi

if command -v cv-joint >/dev/null 2>&1; then
    source_cached cv-joint completion
fi

if command -v acli >/dev/null 2>&1; then
    if [ -n "$ZSH_VERSION" ]; then
        source_cached acli completion zsh
    else
        source_cached acli completion bash
    fi
fi
