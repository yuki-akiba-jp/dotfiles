autoload -Uz zmv
autoload -Uz compinit
# Only regenerate compdump once per day
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
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

if [ -f /usr/local/etc/profile.d/autojump.sh ]; then
  j() {
    unfunction j
    . /usr/local/etc/profile.d/autojump.sh
    j "$@"
  }
fi

source ~/.zsh_alias

function gp() {
 command git fetch origin pull/$1/head:PR-$1
}

export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export PATH="$HOME/.jenv/bin:$PATH"
# Lazy load jenv - only initialize when actually used
jenv() {
  unfunction jenv
  eval "$(command jenv init -)"
  jenv "$@"
}
bindkey '^U' backward-kill-line
# Source kubectl completion from dotfiles
[[ $commands[kubectl] ]] && source ~/dotfiles/packages/zsh/kubectl_completion.zsh 
