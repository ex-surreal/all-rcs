if ! [ -d "$HOME/.oh-my-zsh" ]; then
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

ln -vis $dir/zshrc.zsh ~/.zshrc
