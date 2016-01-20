#!/bin/bash

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

echo $dir

ln -is $dir/.vimrc "$HOME/.vimrc"
ln -is $dir/.gvimrc "$HOME/.gvimrc"
ln -is $dir/.zshrc "$HOME/.zshrc"
ln -is $dir/.my.cnf "$HOME/.my.cnf"
ln -is $dir/.gitconfig "$HOME/.gitconfig"
