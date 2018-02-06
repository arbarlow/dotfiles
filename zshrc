autoload -Uz colors; colors

source ~/.aliases

export GOPATH=~/go
export GOROOT=/usr/local/opt/go/libexec

source ~/.kubectl.zsh

# Show stuff in prompt
precmd() {
  exit_status=$?

  if [ $HISTFILE ]; then
    fg=$prompt_fg
    bg=$prompt_bg
  else
    fg=$prompt_bg
    bg=$prompt_fg
  fi

  PS1="%n@%c"

  if git branch >& /dev/null; then
    PS1="${PS1}%F{yellow}[$(git branch --no-color | grep '^*' | cut -d ' ' -f 2-)]"
  fi

  K8S=$(kubectl config current-context)

  # PS1="${PS1}%F{magenta}(${ZSH_KUBECTL_PROMPT})"

  PS1="${PS1}%{$reset_color%}: %{$reset_color%}"
}

# Set default editor
if [[ -x $(which vim) ]]
then
    export EDITOR="nvim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt share_history

export TIME_STYLE="long-iso"

export TERM='xterm-256color'

setopt CORRECT

stty -ixon

export PATH="$HOME/.rbenv/shims:$PATH"
export PATH=$PATH:$GOPATH/bin
export PATH="./node_modules/.bin:$PATH"

# Autoload screen if we aren't in it.  (Thanks Fjord!)
if [[ $TMUX = '' ]] then tmux; fi

fpath=(~/.completions $fpath)
export fpath
autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

bindkey "[D" backward-word
bindkey "[C" forward-word

eval "$(hub alias -s)"

alias k="kubectl"

git config --global core.excludesfile '~/.gitignore'

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/code/gcloud/path.zsh.inc ]; then source ~/code/gcloud/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f ~/code/gcloud/completion.zsh.inc ]; then source ~/code/gcloud/completion.zsh.inc; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

source <(kubectl completion zsh)

bindkey '^p' clear-screen

export PATH=$PATH:/Users/alexb/bin
export GPG_TTY=$(tty)

git config --global core.excludesfile ~/.gitignore_global

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:$HOME/code/istio/bin"

[[ -s "/Users/alexb/.gvm/scripts/gvm" ]] && source "/Users/alexb/.gvm/scripts/gvm"
