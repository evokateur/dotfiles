PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $ '
setopt nonomatch

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openvpn/sbin:$PATH"

alias vim?='pgrep vim > /dev/null || vim'
alias srsync="rsync -av -e ssh --exclude='.git/'"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

autoload -Uz compinit && compinit
autoload -U add-zsh-hook

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

if [ -f .venv/bin/activate ]
then
    source .venv/bin/activate
fi

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

function venv_auto_switch() {
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

export PATH="/Users/wesley/.pixi/bin:$PATH"
