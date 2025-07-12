# Author: fetch150zy

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fetch150zy"

alias cls='clear'

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"
export LANG=en_US.UTF-8
