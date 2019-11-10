export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export VISUAL='vim'
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=5000
export XDG_CONFIG_HOME=$HOME/.config
export VIMRUNTIME=/usr/local/Cellar/neovim/0.4.3/share/nvim/runtime

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$GOPATH/bin
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)";
fi

# go
#export GOPATH=$HOME/dev

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# vi mode
bindkey -v
