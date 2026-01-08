#compdef hrvst
###-begin-hrvst-completions-###
#
# yargs command completion script
#
# Installation: /usr/local/bin/hrvst completion >> ~/.zshrc
#    or /usr/local/bin/hrvst completion >> ~/.zprofile on OSX.
#
_hrvst_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /usr/local/bin/hrvst --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _hrvst_yargs_completions hrvst
###-end-hrvst-completions-###

