#!/bin/sh

if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

curl -sS https://starship.rs/install.sh --yes | sh 

# vimplug installation
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pip install --upgrade pip
pip install pynvim isort

stow -v -d ~/dotfiles/packages -t ~ git neovim starship tmux zsh coc-snippets docker
