export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH=/Users/wesley/bin:$PATH
export PATH=/Users/wesley/node_modules/.bin:$PATH

# MacPorts Installer addition on 2017-01-28_at_01:42:29: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

set -o vi

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
