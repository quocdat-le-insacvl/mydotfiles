sudo apt install vim git cmake curl
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs default-jdk npm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/quocdat-le-insacvl/mydotfiles  
cp mydotfiles/.vimrc ~/.vimrc
vim ~/.vimrc

cd ~/.vim/plugged/YouCompleteMe/
