#!/bin/sh

if [ ! -f /usr/local/bin/brew ]; then
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

export PATH="/usr/local/bin:$PATH"
brew bundle -v --file=~/dotfiles/Brewfile

pip install --upgrade pip
pip install pynvim isort

stow -v -d ~/dotfiles/packages -t ~  git iterm2 neovim starship tmux zsh  coc-snippets docker

