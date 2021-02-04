# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
	#git
)

source $ZSH/oh-my-zsh.sh

# Load pyenv automatically
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
