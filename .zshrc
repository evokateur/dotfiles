export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export EDITOR=vim

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

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

source "$HOME/.config/shell/env/api-keys.sh"

set -o vi

setopt nonomatch

PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $ '

autoload -Uz compinit && compinit
autoload -U add-zsh-hook

eval "$(pyenv init -)"

source "$HOME/.config/shell/functions/dotfiles.sh"
source "$HOME/.config/shell/functions/tar.sh"
source "$HOME/.config/shell/functions/venv.sh"

if [ "$(scutil --get ComputerName 2>/dev/null)" != "turnip" ]; then
    source "$HOME/.config/shell/functions/remote-plait.sh"
fi

if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

venv_auto_activate

add-zsh-hook chpwd venv_auto_switch

gemini() {
    if [ -z "$GEMINI_API_KEY" ]; then
        export GEMINI_API_KEY="$(pass api/google)"
    fi
    command gemini "$@"
}

alias dots='dotfiles'
alias srsync="rsync -av -e ssh --exclude='.git/' --exclude='node_modules/' --exclude='*.pyc' --exclude='__pycache__/' --exclude='.venv/' --exclude='env/' --exclude='.env/' --exclude='.mypy_cache/' --exclude='.pytest_cache/'"
alias ccusage='npx ccusage@latest'
