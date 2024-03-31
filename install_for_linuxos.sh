#!/bin/sh

if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

curl -sS https://starship.rs/install.sh --yes | sh 

pip install --upgrade pip
pip install pynvim isort

stow -v -d ~/dotfiles/packages -t ~ git neovim starship tmux zsh coc-snippets docker
