#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then # OSX
    # Install brew if not exists
    if ! [ -x "$(command -v brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    if [[ "$(brew list --versions zsh)" == "" ]]; then
        brew update
        # Install zsh
        brew install zsh
    fi
fi

# TODO: install zsh for linux

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

source $dir/vim/script.sh
source $dir/zsh/script.sh
source $dir/git/script.sh
