autoload -Uz zmv
autoload -Uz compinit  && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export LSCOLORS=Cxfxcxdxbxegedabagacad

export PATH="/usr/local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export PYTHONPATH="/usr/bin/python3"
eval "$(starship init zsh)"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source ~/.zsh_alias

function gp() {
 command git fetch origin pull/$1/head:PR-$1
}

export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
bindkey '^U' backward-kill-line
