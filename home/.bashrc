# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
iatest=$(expr index "$-" i)

# Disable Ctrl-S and Ctrl-Q. Useful for my tmux config.
stty -ixon
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
FGRN="\[\033[32m\]" # foreground green
FBLE="\[\033[34m\]" # foreground blue
FRED="\[\033[31m\]" # foreground red
FCYN="\[\033[36m\]" # foreground cyan

if [ $UID = 0 ]; then
	export PS1="$HC$FRED\u@\h:$FBLE\w$RS # "
else
	export PS1="\[\033[0;37m\]\[[\033[0;36m\]\u\[\033[0;37m\]]\342\224\200[\[\033[0;31m\]\h\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[0m\]"
fi
# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#include aliases
. ~/.bash_aliases
#include ~/.bash_functions
. ~/.bash_functions
#include MC
export LESS_TERMCAP_mb=$'\E[01;33m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#export MAIL="~/Mail/countolaf17@gmail.com/INBOX"
HISTSIZE= HISTSIZE= # Infinite.
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T"
HISTIGNORE='&:[ ]*'
HISTFILESIZE= HISTFILESIZE= # Infinite as well.
export LESSCHARSET="utf8"
export LESSOPEN="|/usr/bin/lesspipe %s 2>&-"
export LESS="-i -N -w	-z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%: ?lbLine %lb:?bbByte %bb:-..."
export NICKNAME="Jalus"
export HOSTFILE="/etc/hosts"
export PATH="$PATH:~/.scripts"
#export PATH="$PATH:~/.vim/bundle/vim-live-latex-preview/bin"
export PATH="$PATH:~/.arc/arcanist/bin/"
export INPUTRC="~/.inputrc"
XDG_CONFIG_HOME="~/.config"
LIGHTGRAY="\033[0;37m"
CYAN="\033[0;36m"
LIGHTCYAN="\033[1;36m"
GRAY="\[\033[1;30m\]"
DARKGRAY="\033[1;30m"
EMACS=emacs
PS2="$LIGHT_CYAN>$CYAN>$GRAY>$LIGHT_GRAY "
PS3="Please enter a number from the list above: "
PS4="\[${DARKGRAY}\]+\[${NOCOLOR}\] "
echo "####################################################"
echo -ne "Quote of the terminal:"
echo
fortune
echo "####################################################"
echo
hour=$(date +"%H")
day=$(date +"%B%e")
year=$(date +"%Y")
hol=1
if [ $hour -ge 0 -a $hour -lt 12 ]; then
	greet="Good Morning, $NICKNAME. Welcome back."
elif [ $hour -ge 12 -a $hour -lt 18 ]; then
	greet="Good Afternoon, $NICKNAME. Welcome back."
else
	greet="Good Evening, $NICKNAME. Welcome back."
fi
echo $greet
if [ "$day" = "January1" ]; then
	holgreet="It's New Year's Day! Have a happy $year."
elif [ "$day" = "Febuary2" ]; then
	holgreet="It's both Superbowl and Groundhog Day! Have a happy one."
elif [ "$day" = "Febuary14" ]; then
	holgreet="Happy Valentine's Day!"
elif [ "$day" = "May14" ]; then
	holgreet="Happy Birthday!"
elif [ "$day" = "July4" ]; then
	holgreet="Happy U.S. Independence Day!"
elif [ "$day" = "October31" ]; then
	holgreet="Happy Halloween."
elif [ "$day" = "December24" ]; then
	holgreet="Have a great Christmas Eve!"
elif [ "$day" = "December25" ]; then
	holgreet="Merry Christmas!"
elif [ "$day" = "December31" ]; then
	holgreet="Happy New Year's Eve."
else
	hol=0
fi
if [ "$hol" = "1" ]; then
	echo $holgreet
fi
shopt -s histappend histreedit histverify
shopt -q -s cdspell
shopt -s sourcepath
shopt -s extglob
shopt -s checkhash
shopt -s cmdhist
shopt -s autocd
set -o notify
set -o noclobber
set -b
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=dvorak
export LD_LOAD_PATH="/usr/bin"
export WLC_LIBINPUT="1"
export WLC_XWAYLAND="1"
export WLC_BUFFER_API="GBM"
#PROMPT_COMMAND='__setprompt'
unset MAILCHECK
export MAILPATH="~/Mail/countolaf17@gmail.com"
export MAILDIR="~/Mail/countolaf17@gmail.com"
ulimit -S -c 0
export PATH=$(echo $PATH | awk -F: '
{ for (i = 1; i <= NF; i++) arr[$i]; }
END { for (i in arr) printf "%s:" , i; printf "\n"; } ')
complete -cf sudo
