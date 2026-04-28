export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export VISUAL='vim'
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# XDG
export XDG_CONFIG_HOME=$HOME/.config

# nvim
export VIMRUNTIME=/opt/homebrew/Cellar/neovim/*/share/nvim/runtime

# pyenv
#export PYENV_ROOT=~/.pyenv

# cargo
source "$HOME/.cargo/env"

# go
export PATH=$PATH:~/go/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#export PATH="~/.local/share/solana/install/active_release/bin:$PATH"
#export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
#
#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#

export PATH="$HOME/.local/bin:$PATH"
