export LANG=en_US.UTF-8 # You may need to manually set your language environment

export HISTSIZE=100000
export SAVEHIST=100000

export KEYTIMEOUT=1 # Reduce to dalay to go to normal mode

stty -ixon

alias ls='ls -G'
alias ll='ls -l'
alias la='ll -A'

[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh

export HISTFILE=~/.zsh_history
setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS # Do not display a previously found event.
setopt HIST_IGNORE_SPACE # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS # Do not write a duplicate event to the history file.

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^?" backward-delete-char

export PROMPT=$'%~\n%n@%m %% '

bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
