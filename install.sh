#!/bin/bash

# Install brew if not exists
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Install necessary things
brew install zsh

brew cleanup

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
chsh -s $(which zsh)

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

ln -is $dir/.vimrc "$HOME/.vimrc"
ln -is $dir/.gvimrc "$HOME/.gvimrc"
ln -is $dir/.zshrc "$HOME/.zshrc"
ln -is $dir/.my.cnf "$HOME/.my.cnf"
ln -is $dir/.gitconfig "$HOME/.gitconfig"
