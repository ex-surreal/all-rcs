#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then # OSX

  if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || exit 1
  fi

  # brew update
  # Install minimum env
  # brew install zsh vim git tmux

elif [[ "$OSTYPE" == "linux"* ]]; then # LINUX

  sudo pacman -S tmux python zsh git vim --noconfirm -q || exit 1

fi

# TODO: install zsh for ubuntu

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

$dir/vim/script.sh || exit 1
$dir/zsh/script.sh || exit 1
$dir/git/script.sh || exit 1
