#!/bin/sh
if [ ! -f /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

set -e 

if [ "$(dscl . -read ~/ UserShell)" = "UserShell: /bin/bash" ]; then
    chsh -s $(which zsh)
fi

if [ ! -d ~/dotfiles ]; then
cd ~
git clone git@github.com:yuki-akiba-jp/dotfiles.git
fi

brew bundle -v --file=~/dotfiles/Brewfile

if [ ! -d ~/.config ]; then
    mkdir ~/.config
if

stow -v -d ~/dotfiles/packages -t ~ alfred git iterm2 neovim starship tmux zsh
