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

# export HTTP_PROXY="http://127.0.0.1:7890"
# export HTTPS_PROXY="http://127.0.0.1:7890"
# export ALL_PROXY="socks5://127.0.0.1:7890"

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1