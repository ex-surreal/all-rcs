export PS1="\w\n\u@\h $ "
[ -f ~/.shell_profile ] && source ~/.shell_profile
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
shopt -s histappend # append to history, don't overwrite it
export HISTFILE=~/.bash_history
