autoload -Uz colors; colors
source ~/.aliases


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

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Autoload screen if we aren't in it.  (Thanks Fjord!)
if [[ $TMUX = '' ]] then tmux; fi

fpath=(~/.completions $fpath)
export fpath

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

eval "$(hub alias -s)"

alias k="kubectl"

git config --global core.excludesfile '~/.gitignore'
git config --global core.excludesfile ~/.gitignore_global

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/code/google-cloud-sdk/path.zsh.inc ]; then source ~/code/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f ~/code/google-cloud-sdk/completion.zsh.inc ]; then source ~/code/google-cloud-sdk/completion.zsh.inc; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey '^p' clear-screen
