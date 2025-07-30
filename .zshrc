export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/openvpn/sbin:$PATH"

export PATH="/Library/TeX/texbin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"
export PATH="$HOME/.pixi/bin:$PATH"
export PATH="$HOME/.claude/local:$PATH"

set -o vi

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

venv_auto_activate

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

venv() {
    echo "VENV_ROOT=$VENV_ROOT"
    echo "VIRTUAL_ENV=$VIRTUAL_ENV"
}

alias srsync="rsync -av -e ssh --exclude='.git/' --exclude='node_modules/' --exclude='*.pyc' --exclude='__pycache__/' --exclude='.venv/' --exclude='env/' --exclude='.env/' --exclude='.mypy_cache/' --exclude='.pytest_cache/'"
alias dot='dotfiles'

if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty/macos"
