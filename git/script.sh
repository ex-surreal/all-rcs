predir=$(pwd)
cd $(dirname $0)
dir=$(pwd)
cd $predir

ln -vis $dir/gitconfig ~/.gitconfig
mkdir -p ~/.git_template/hooks/
ln -vis $dir/hooks/* ~/.git_template/hooks/
