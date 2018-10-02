export PATH=$PATH:$(go env GOPATH)/bin

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Reduce to dalay to go to normal mode
export KEYTIMEOUT=1

# For python
[ -f ~/.pythonrc ] && export PYTHONSTARTUP=~/.pythonrc

stty -ixon

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "modules/history", from:prezto
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "rupa/z", from:github, use:z.sh
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load

if ! zplug check --verbose; then
  zplug install
fi

bindkey -v

if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi
export HISTFILE=~/.zsh_history

[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
