# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#[[ $TERM = "linux" ]] && tmux && exit

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
FGRN="\[\033[32m\]" # foreground green
FBLE="\[\033[34m\]" # foreground blue
FRED="\[\033[31m\]" # foreground red
FCYN="\[\033[36m\]" # foreground cyan

if [ $UID = 0 ]; then
	PS1="$HC$FRED\u@\h:$FBLE\w$RS # "
fi
# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#alias ls='ls -F --color=auto --group-directories-first'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'

#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

#include ~/.bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#include ~/.bash_functions if it exists
#if [ -f ~/.bash_functions ]; then
#    . ~/.bash_functions
#fi

export LESS_TERMCAP_mb=$'\E[01;33m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export MAIL="~/Mail/countolaf17@gmail.com/INBOX"
HISTSIZE=2000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S"
HISTIGNORE='&:[ ]*'
HISTFILESIZE=2000
export EDITOR="nano"
export VISUAL=$EDITOR
export PAGER="/usr/bin/less"
export NICKNAME="Jalus"
export HOSTFILE="/etc/hosts"
export PATH="$PATH:~/bin"
export INPUTRC="~/.inputrc"
export PS1="\[\033[0;37m\]\[[\033[0;36m\]\u\[\033[0;37m\]]\342\224\200[\[\033[0;31m\]\h\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[0m\]"
export PS2="Secondary> "
export PS3="Pick one: "
export PS4="+ debugging> "
echo -ne "Good day $NICKNAME! it's "; date '+%A, %B %-d %Y'
echo "####################################################"
echo -ne "Finally, your daily Fortune:"
echo
fortune
echo "####################################################"
shopt -s histappend
shopt -q -s cdspell
set -o notify
set -o vi