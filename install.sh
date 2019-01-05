#!/bin/sh


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for file in .vimrc .zshrc .iterm; do
	[ -e $DIR/$file ] && ln -fs $DIR/$file $HOME
done
