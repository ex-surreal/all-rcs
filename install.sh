#!/bin/bash

# Install brew if not exists
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(brew list --versions zsh)" == "" ]]; then
  brew update
  # Install zsh
  brew install zsh
fi

if ! [ -d "$HOME/.oh-my-zsh" ]; then
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if ! [ -f "$HOME/.vim/autoload/plug.vim" ]; then
  # Install plugin manager for vim
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

ln -is $dir/.vimrc "$HOME/.vimrc"
ln -is $dir/.gvimrc "$HOME/.gvimrc"
ln -is $dir/.zshrc "$HOME/.zshrc"
ln -is $dir/.my.cnf "$HOME/.my.cnf"
ln -is $dir/.gitconfig "$HOME/.gitconfig"
