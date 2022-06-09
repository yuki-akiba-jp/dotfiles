autoload -Uz zmv
autoload -Uz compinit  && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
eval "$(starship init zsh)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export LSCOLORS=Cxfxcxdxbxegedabagacad
export RBENV_ROOT=$(brew --prefix rbenv) 
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"

export OPENSSL_ROOT=$(brew --prefix openssl)
export PATH="$OPENSSL_ROOT/bin:$PATH"
export LDFLAGS="-L$OPENSSL_ROOT/lib"
export CPPFLAGS="-I$OPENSSL_ROOT/include"
export PKG_CONFIG_PATH="$OPENSSL_ROOT/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_ROOT"

export LIBXML2_ROOT=$(brew --prefix libxml2)
export PATH="$LIBXML2_ROOT/bin:$PATH"
export LDFLAGS="$LDFLAGS -L$LIBXML2_ROOT/lib"
export CPPFLAGS="$CPPFLAGS -I$LIBXML2_ROOT/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$LIBXML2_ROOT/lib/pkgconfig"

export LIBXSLT_ROOT=$(brew --prefix libxslt)
export PATH="$LIBXSLT_ROOT/bin:$PATH"
export LDFLAGS="$LDFLAGS -L$LIBXSLT_ROOT/lib"
export CPPFLAGS="$CPPFLAGS -I$LIBXSLT_ROOT/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$LIBXSLT_ROOT/lib/pkgconfig"

export LIBICONV_ROOT=$(brew --prefix libiconv)
export PATH="$LIBICONV_ROOT/bin:$PATH"
export LDFLAGS="-L$LIBICONV_ROOT/lib $LDFLAGS"
export CPPFLAGS="-I$LIBICONV_ROOT/include $CPPFLAGS"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
chmod +x ~/.zsh_alias
source ~/.zsh_alias
export PATH="~/prog_class/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yukiakiba/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yukiakiba/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/yukiakiba/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yukiakiba/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate flask_app

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/yukiakiba/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
