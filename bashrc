# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILE=$HOME/.histfile
HISTSIZE=50000
HISTFILESIZE=50000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='[\[\033[01;32m\]\h\[\033[00m\]]\$ '
PROMPT_COMMAND='if [ $TERM == "screen" ]; then printf "\ek${PWD/$HOME/~}\e\\"; fi'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# environment variables
PATH=/usr/sbin:/usr/bin:/usr/local/bin:/sbin:/bin
export PATH
export EDITOR="vim -u ~/config/vimrc"

# To enable agent forwarding when screen is reconnected.
AUTH_SOCK="$HOME/.ssh/.ssh-auth-sock"
if [ -S "$AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$AUTH_SOCK
elif [ ! -S "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$AUTH_SOCK
elif [ ! -L "$SSH_AUTH_SOCK" ]; then
    ln -snf "$SSH_AUTH_SOCK" $AUTH_SOCK && export SSH_AUTH_SOCK=$AUTH_SOCK
fi

function _expand(){ return 0; }

# alias
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias vim="vim -u ~/config/vimrc"
alias vi="vim"
alias screen="screen -c ~/config/screenrc"

unset command_not_found_handle
