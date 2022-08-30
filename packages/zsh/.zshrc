autoload -Uz zmv
autoload -Uz compinit  && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
eval "$(starship init zsh)"
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export LSCOLORS=Cxfxcxdxbxegedabagacad

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
# chmod +x ~/.zsh_alias
source ~/.zsh_alias
export PATH=~/.npm-global/bin:$PATH
