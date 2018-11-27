#!/bin/sh


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for file in .vimrc .gitconfig .zshrc .tmux.conf .iterm .shell_profile .bash_profile .zsh_profile; do
	[ -e $DIR/$file ] && ln -fs $DIR/$file $HOME
done
