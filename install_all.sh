sudo apt install vim git cmake curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/quocdat-le-insacvl/mydotfiles  
cp mydotfiles/.vimrc ~/.vimrc
vim ~/.vimrc
