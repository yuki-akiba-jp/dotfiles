#!/bin/sh
if [ ! -f /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -c https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

brew bundle -v --file=~/dotfiles/Brewfile

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# vimplug installation
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

stow -v -d ~/dotfiles/packages -t ~ alfred git iterm2 neovim starship tmux zsh  coc-snippets
