#!/bin/sh


DIR=`dirname $(realpath $0)`

for file in .vimrc .gitconfig .zshrc .tmux.conf; do
	[ -f $DIR/$file ] && ln -fs $DIR/$file $HOME
done
