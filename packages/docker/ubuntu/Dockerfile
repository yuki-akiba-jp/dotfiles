FROM --platform=linux/amd64 ubuntu:latest

RUN apt update -y && apt upgrade -y  && apt install -y \
    curl\
    stow\
    tmux\
    gcc\
    vim\
    nodejs\
    perl\
    python3\
    ruby\
    ctags\
    git

RUN  curl -o - https://raw.githubusercontent.com/yuki-akiba-jp/dotfiles/main/install_for_linuxos.sh | sh
