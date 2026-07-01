# zmodload zsh/datetime 2>/dev/null
# ZSHRC_START=$EPOCHREALTIME

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

export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# pnpm
export PNPM_HOME="/Users/wesley/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

PAKE_CREATE_APP=1

source "$HOME/.config/shell/env/paths.sh"

_computer_name="$(scutil --get ComputerName 2>/dev/null)"
_host_env="$HOME/.config/shell/env/$_computer_name.sh"
[[ -f $_host_env ]] && source $_host_env
unset _host_env

if [[ "$_computer_name" != "turnip" ]]; then
    source "$HOME/.config/shell/functions/turnip-remote.sh"
fi
unset _computer_name

set -o vi

setopt nonomatch

PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $ '

fpath=(~/.zsh/completions $fpath)

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi
autoload -U add-zsh-hook

source "$HOME/.config/shell/functions/wrappers.sh"
source "$HOME/.config/shell/functions/nvim-wrapper.sh"
source "$HOME/.config/shell/functions/claude-context.sh"
source "$HOME/.config/shell/functions/claude-wrapper.sh"
source "$HOME/.config/shell/functions/dotfiles.sh"
source "$HOME/.config/shell/functions/completions.sh"
source "$HOME/.config/shell/functions/tar.sh"
source "$HOME/.config/shell/functions/venv.sh"


if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

venv_auto_activate

add-zsh-hook chpwd venv_auto_switch

alias vault='git --git-dir="$VAULT_ROOT"/.git --work-tree="$VAULT_ROOT"'
alias ov='git --git-dir="$VAULT_ROOT"/.git --work-tree="$VAULT_ROOT"'
alias dfl='dotfiles'
alias sync-dfl='sync-dotfiles'
alias srsync="rsync -av -e ssh --exclude='.git/' --exclude='node_modules/' --exclude='*.pyc' --exclude='__pycache__/' --exclude='.venv/' --exclude='env/' --exclude='.env/' --exclude='.mypy_cache/' --exclude='.pytest_cache/'"
alias ccusage='npx ccusage@latest'
alias rm='rm -I'
alias dm='dark-mode'

# LC_NUMERIC=C printf "zshrc loaded in %.3f s\n" \
#     "$(( EPOCHREALTIME - ZSHRC_START ))"
