#file# $HOME/.zshrc

# Setup completion stuff
autoload -U compinit
compinit
zstyle ':completion::complete:*' use-cache 1

# Colours
autoload -U colors
colors

setopt autopushd pushdsilent
export DIRSTACKSIZ=20

## Aliases
# SOURCE: http://www.opensource.apple.com/darwinsource/Current/zsh-42/zsh/StartupFiles/zshrc
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias d='dirs -v'

alias grep='grep --color=always'
alias ls='ls -G'

## Prompt
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}> %{$reset_color%}"
RPROMPT="  %{$fg[yellow]%}< %~ %{$reset_color%}"     # prompt for right side of screen

## Set/unset  shell options
# History Stuff
setopt histignoredups
export HISTSIZE=1000
export SAVEHIST=5000
export HISTFILE=~/.zhistory
setopt inc_append_history
setopt SHARE_HISTORY # import new commands from the history file also in other zsh-session
setopt correct # try to correct spelling
setopt extended_glob
setopt nobeep
watch=(all)

# Key Bindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^r" history-incremental-search-backward

# Set key bindings to vi
bindkey -v

# Ensure history expansion also works on space
bindkey ' ' magic-space

# load colors
autoload -U colors
colors

# Ensure less has some colour
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# MISC
NNTPSERVER='nntp.perl.org' && export NNTPSERVER

# Ruby Version Manager - http://rvm.beginrescueend.com/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
