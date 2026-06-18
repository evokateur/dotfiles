# Sourced into the interactive shell — not executed directly.
# Cache completion outputs so we can source a regular file instead of a process substitution.
# Cache location follows XDG spec (falls back to ~/.cache).
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
cache_dir="$XDG_CACHE_HOME/completions"
mkdir -p -- "$cache_dir"

# Try macOS stat first, fall back to GNU.
if [[ "$OSTYPE" == darwin* ]]; then
    stat_mtime() { stat -f %m "$1" 2>/dev/null; }
else
    stat_mtime() { stat -c %Y "$1" 2>/dev/null; }
fi

# generate_or_use_cache <cmd> [args...]
# - Runs <cmd> [args...] and caches stdout to a file under $cache_dir/<cmd>.sh
# - Regenerates if cache missing or if the command binary's mtime is newer than the cache
# - Sources the cached file
generate_or_use_cache() {
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

generate_or_use_cache hrvst completion
generate_or_use_cache cv-joint completion
