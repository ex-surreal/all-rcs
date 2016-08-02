if ! [ -f ~/.vim/autoload/plug.vim ]; then
    # Install plugin manager for vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

mkdir -p ~/.vim/dotfiles
ln -vis $dir/dotfiles/* ~/.vim/dotfiles
ln -vis $dir/vimrc.vim ~/.vimrc
