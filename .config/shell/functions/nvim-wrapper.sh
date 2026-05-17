nvim() {
    search_dir="$PWD"
    found_uv_lock=""
    while [ "$search_dir" != "/" ]; do
        if [ -f "$search_dir/uv.lock" ]; then
            found_uv_lock="$search_dir/uv.lock"
            break
        fi
        search_dir="$(dirname "$search_dir")"
    done

    if [ -n "$found_uv_lock" ]; then
        uv run nvim "$@"
    else
        command nvim "$@"
    fi
}
