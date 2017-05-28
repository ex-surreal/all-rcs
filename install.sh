#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then # OSX
  # Install brew if not exists
  if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  # Install minimum env
  brew install zsh vim git

elif [[ "$OSTYPE" == "linux"* ]]; then # LINUX
  pacman -S zsh git vim --noconfirm -q
fi

# TODO: install zsh for ubuntu

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

$dir/vim/script.sh
$dir/zsh/script.sh
$dir/git/script.sh
