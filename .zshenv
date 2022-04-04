export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export VISUAL='vim'
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

# XDG
export XDG_CONFIG_HOME=$HOME/.config

# nvim
export VIMRUNTIME=/opt/homebrew/Cellar/neovim/0.6.1/share/nvim/runtime

# pyenv
export PYENV_ROOT=~/.pyenv

# rust
source "$HOME/.cargo/env"

# go
export PATH=$PATH:~/go/bin

# solana
export PATH="~/.local/share/solana/install/active_release/bin:$PATH"
