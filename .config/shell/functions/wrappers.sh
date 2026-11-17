pyenv() {
    unset -f pyenv
    eval "$(command pyenv init -)"
    pyenv "$@"
}

gemini() {
    if [ -z "$GEMINI_API_KEY" ]; then
        export GEMINI_API_KEY="$(pass api/google)"
    fi
    command gemini "$@"
}

codex() {
    if [ -z "$ATLASSIAN_SA_API_TOKEN" ]; then
        export ATLASSIAN_SA_API_TOKEN="$(pass api/atlassian/praxithrax)"
    fi
    if [ -z "$GITHUB_PA_TOKEN" ]; then
        export GITHUB_PA_TOKEN="$(pass api/github/pat4mcp)"
    fi
    command codex "$@"
}
