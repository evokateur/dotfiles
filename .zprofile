export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH=/Users/wesley/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH

##
# Your previous /Users/wesley/.bash_profile file was backed up as /Users/wesley/.bash_profile.macports-saved_2017-01-28_at_01:42:29
##

# MacPorts Installer addition on 2017-01-28_at_01:42:29: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

set -o vi

alias bfg='java -jar ~/bin/bfg-1.13.0.jar'

alias rmfoo='rm -rf foo'

# Added by `rbenv init` on Jeu 18 jul 2024 15:54:50 PDT
eval "$(rbenv init - --no-rehash zsh)"

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
