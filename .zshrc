export ZSH="/Users/alex/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source ~/.aliases

plugins=(
  git
  dotenv
  macos
	golang
	kubectl
	docker-compose
	vi-mode
	fzf
	gcloud
	rust
)

source $ZSH/oh-my-zsh.sh

bindkey '^p' clear-screen

if [[ $TMUX = '' ]] then tmux; fi

export PATH=$PATH:~/go/bin
export PATH=$PATH:~/cargo/bin
