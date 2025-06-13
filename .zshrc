PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $ '
setopt nonomatch

autoload -Uz compinit && compinit
autoload -U add-zsh-hook

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

dotfiles() {
    if [[ "$1" == "add" && "$2" == "." ]]; then
        echo "❌ Refusing to run 'dotfiles add .' — be specific!"
        return 1
    fi
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

find_venv_root() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.venv" ]]; then
            echo "$dir"
            return
        fi
        dir=$(dirname "$dir")
    done
}

venv() {
    local new_root=$(find_venv_root)
    if [[ -n "$new_root" ]]; then
        export VENV_ROOT="$new_root"
        source "$new_root/.venv/bin/activate"
    fi
}

venv

venv_auto_switch() {
    local new_root=$(find_venv_root)

    if [[ -n "$new_root" ]]; then
        if [[ "$VENV_ROOT" != "$new_root" ]]; then
            [[ -n "$VIRTUAL_ENV" ]] && deactivate
            source "$new_root/.venv/bin/activate"
            export VENV_ROOT="$new_root"
        fi
    else
        if [[ -n "$VIRTUAL_ENV" ]]; then
            deactivate
            unset VENV_ROOT
        fi
    fi
}

add-zsh-hook chpwd venv_auto_switch

echo_venv() {
    echo "VENV_ROOT: $VENV_ROOT"
    echo "VIRTUAL_ENV: $VIRTUAL_ENV"
}

getenv() {
    local var="$1"
    [ -z "$var" ] && return

    local line
    line=$(grep -E "^\s*$var\s*=" .env | grep -Ev '^\s*#' | head -n 1) || return
    [ -z "$line" ] && return

    local value=${line#*=}

    value=$(printf '%s' "$value" | sed -E 's/^"([^"]*)"$/\1/; s/^'\''([^'\'']*)'\''$/\1/')

    [ -n "$value" ] || return
    printf '%s\n' "$value"

    if command -v pbcopy >/dev/null 2>&1; then
        printf '%s' "$value" | pbcopy
        echo "..copied to clipboard"
    elif command -v xclip >/dev/null 2>&1; then
        printf '%s' "$value" | xclip -selection clipboard
        echo "..copied to clipboard"
    elif command -v wl-copy >/dev/null 2>&1; then
        printf '%s' "$value" | wl-copy
        echo "..copied to clipboard"
    fi
}

alias vim?='pgrep vim > /dev/null || vim'
alias srsync="rsync -av -e ssh --exclude='.git/'"
alias dot='dotfiles'
