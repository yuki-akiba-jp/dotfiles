#!/bin/sh

if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

chsh -s $(which zsh)

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# vimplug installation
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

stow -v -d ~/dotfiles/packages -t ~  git  neovim starship tmux zsh  coc-snippets docker
