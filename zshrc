autoload -Uz colors; colors

source ~/.aliases

export GOPATH=~/code/go
export GO=$GOPATH/bin
export GOROOT=`go env GOROOT`

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
  
  PS1="${PS1}:%F{green}[$(rbenv version | sed -e 's/ .*//')]%{$reset_color%}"

  if git branch >& /dev/null; then
    PS1="${PS1}%F{yellow}[$(git branch --no-color | grep '^*' | cut -d ' ' -f 2-)]"
  fi

  PS1="${PS1}%{$reset_color%}: %{$reset_color%}"
}

# Set default editor
if [[ -x $(which vim) ]]
then
    export EDITOR="mvim -v"
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

export TIME_STYLE="long-iso"

export TERM='xterm-256color'

setopt CORRECT

stty -ixon

# PATH="$HOME/.rbenv/bin:$PATH"
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
