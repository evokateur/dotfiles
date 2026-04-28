zmodload zsh/datetime 2>/dev/null
ZSHRC_START=$EPOCHREALTIME

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export EDITOR=nvim

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

export PATH=/Users/wesley/.opencode/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# pnpm
export PNPM_HOME="/Users/wesley/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

PAKE_CREATE_APP=1

source "$HOME/.config/shell/env/api-keys.sh"
source "$HOME/.config/shell/env/paths.sh"

if [ "$(scutil --get ComputerName 2>/dev/null)" = "cipolla" ]; then
    source "$HOME/.config/shell/env/cipolla.sh"
fi

set -o vi

setopt nonomatch

PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $ '

fpath=(~/.zsh/completions $fpath)

autoload -Uz compinit && compinit
autoload -U add-zsh-hook

pyenv() {
    unset -f pyenv
    eval "$(command pyenv init - zsh)"
    pyenv "$@"
}

source "$HOME/.config/shell/functions/claude-context.sh"
source "$HOME/.config/shell/functions/dotfiles.sh"
source "$HOME/.config/shell/functions/hrvst-completion.zsh"
source "$HOME/.config/shell/functions/tar.sh"
source "$HOME/.config/shell/functions/venv.sh"

if [ "$(scutil --get ComputerName 2>/dev/null)" != "turnip" ]; then
    source "$HOME/.config/shell/functions/turnip-remote.sh"
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

alias vault='git --git-dir=$VAULT_PATH/.git --work-tree=$VAULT_PATH'
alias ov='git --git-dir=$VAULT_PATH/.git --work-tree=$VAULT_PATH'
alias dfl='dotfiles'
alias srsync="rsync -av -e ssh --exclude='.git/' --exclude='node_modules/' --exclude='*.pyc' --exclude='__pycache__/' --exclude='.venv/' --exclude='env/' --exclude='.env/' --exclude='.mypy_cache/' --exclude='.pytest_cache/'"
alias ccusage='npx ccusage@latest'
alias rm='rm -I'

#LC_NUMERIC=C printf "zshrc loaded in %.3f s\n" \
#      "$(( EPOCHREALTIME - ZSHRC_START ))"
