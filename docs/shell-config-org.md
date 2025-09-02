# Shell Configuration Organization (.bashrc/.zshrc)

by Claude

## Recommended Section Order

### 1. Shell Options & Interactive Check
**Purpose**: Basic shell setup and early exit for non-interactive shells
**Examples**:
```bash
# Exit if not running interactively
case $- in
    *i*) ;;
    *) return ;;
esac

# Basic shell options
set -o vi  # vi mode
```

### 2. Environment Variables
**Purpose**: Core environment setup, especially PATH
**Examples**:
```bash
export EDITOR=vim
export BROWSER=firefox
export PATH="$HOME/.local/bin:$HOME/.bin:/usr/local/bin:$PATH"
```

### 3. History Configuration
**Purpose**: Control command history behavior
**Examples**:
```bash
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend  # bash
setopt APPEND_HISTORY  # zsh
```

### 4. Shell Behavior Options
**Purpose**: Configure shell-specific behaviors
**Examples**:
```bash
# Bash
shopt -s checkwinsize
shopt -s globstar
shopt -s autocd

# Zsh
setopt AUTO_CD
setopt GLOB_COMPLETE
setopt CORRECT
```

### 5. Terminal/Cosmetic Configuration
**Purpose**: Prompts, colors, and visual appearance
**Examples**:
```bash
# Color support
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

# Prompt configuration
PS1='\u@\h:\w\$ '

# Terminal title
case "$TERM" in
    xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
esac
```

### 6. Tool Initialization
**Purpose**: Initialize external tools that may define functions/completions
**Examples**:
```bash
# Version managers
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(nvm use default)"

# Package managers
eval "$(/opt/homebrew/bin/brew shellenv)"

# Other tools
eval "$(direnv hook bash)"
```

### 7. Sourced Function Libraries
**Purpose**: Load external function definitions
**Examples**:
```bash
# Load custom function libraries
source "$HOME/.config/shell/functions/git.sh"
source "$HOME/.config/shell/functions/docker.sh"

# Load completions
if [ -f ~/.bash_completion ]; then
    source ~/.bash_completion
fi
```

### 8. Custom Functions
**Purpose**: Functions defined directly in the rc file
**Examples**:
```bash
mkcd() {
    mkdir -p "$1" && cd "$1"
}

extract() {
    case $1 in
        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz) tar xzf "$1" ;;
        *.zip) unzip "$1" ;;
    esac
}
```

### 9. Aliases
**Purpose**: Command shortcuts and modifications (must come last)
**Examples**:
```bash
alias ll='ls -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## Why This Order Matters

### Dependencies
- **PATH before tools**: Tools need their binaries to be findable
- **Functions before aliases**: Aliases can reference functions, but not vice versa
- **Environment before everything**: Many tools depend on environment variables

### Shell Resolution Order
When you type a command, shells resolve in this order:
1. Functions
2. Built-ins
3. Executables (from PATH)
4. Aliases

### Performance
- **Early exit**: Non-interactive check prevents unnecessary processing
- **Expensive operations last**: Tool initialization can be slow

## Best Practices

### Modularity
```bash
# Good: Separate files for different concerns
source "$HOME/.config/shell/functions/development.sh"
source "$HOME/.config/shell/aliases/git.sh"

# Avoid: Everything in one massive file
```

### Conditional Loading
```bash
# Only load if tool exists
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# Platform-specific configuration
case "$(uname)" in
    Darwin) source "$HOME/.config/shell/macos.sh" ;;
    Linux) source "$HOME/.config/shell/linux.sh" ;;
esac
```

### Error Handling
```bash
# Graceful failure for optional sources
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"

# Or with error checking
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
else
    echo "Warning: .bash_aliases not found"
fi
```

## Common Sections Summary

| Section | Purpose | Dependencies |
|---------|---------|--------------|
| Interactive Check | Early exit | None |
| Environment | Core setup | None |
| History | Command history | None |
| Shell Options | Behavior config | None |
| Cosmetic | Visual setup | Environment |
| Tool Init | External tools | Environment, PATH |
| Sourced Functions | External logic | Tools |
| Custom Functions | Local logic | All above |
| Aliases | Shortcuts | Functions |

This organization ensures reliable loading, proper dependencies, and maintainable configuration.
