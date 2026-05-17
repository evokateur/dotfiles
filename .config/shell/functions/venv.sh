find_venv_root() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.venv" ]]; then
            if [[ -f "$dir/uv.lock" ]]; then
                return
            fi
            echo "$dir"
            return
        fi
        dir=$(dirname "$dir")
    done
}

venv_auto_activate() {
    local new_root=$(find_venv_root)
    if [[ -n "$new_root" ]]; then
        source "$new_root/.venv/bin/activate"
        export VENV_ROOT="$new_root"
    fi
}

venv_auto_switch() {
    local new_root=$(find_venv_root)

    if [[ -n "$new_root" ]]; then
        if [[ "$VENV_ROOT" != "$new_root" ]]; then
            [[ -n "$VIRTUAL_ENV" ]] && deactivate
            source "$new_root/.venv/bin/activate"
            export VENV_ROOT="$new_root"
        fi
    else
        if [[ -n "$VIRTUAL_ENV" ]] && declare -f deactivate >/dev/null; then
            deactivate
            unset VENV_ROOT
        fi
    fi
}

dump_venv() {
    echo "VENV_ROOT=$VENV_ROOT"
    echo "VIRTUAL_ENV=$VIRTUAL_ENV"
}
