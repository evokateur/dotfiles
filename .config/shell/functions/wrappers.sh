pyenv() {
    unset -f pyenv
    eval "$(command pyenv init - zsh)"
    pyenv "$@"
}

gemini() {
    if [ -z "$GEMINI_API_KEY" ]; then
        export GEMINI_API_KEY="$(pass api/google)"
    fi
    command gemini "$@"
}
