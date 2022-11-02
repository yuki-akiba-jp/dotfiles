#!/bin/sh
if [ ! -f /bin/brew ]; then
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc

if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

brew install gcc
brew bundle -v --file=~/dotfiles/Brewfile

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# vimplug installation
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

stow -v -d ~/dotfiles/packages -t ~  git  neovim starship tmux zsh  coc-snippets
chsh -s $(which zsh)
