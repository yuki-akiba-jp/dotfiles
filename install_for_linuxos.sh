#!/bin/sh

if [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone https://github.com/yuki-akiba-jp/dotfiles.git
fi

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
brew bundle -v --file=~/dotfiles/BrewfileForLinux

# vimplug installation
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pip install --upgrade pip
pip install pynvim isort

stow -v -d ~/dotfiles/packages -t ~ git neovim starship tmux zsh coc-snippets docker
