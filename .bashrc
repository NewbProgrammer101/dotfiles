# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
iatest=$(expr index "$-" i)
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
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
#include aliases
. ~/.bash_aliases
#include ~/.bash_functions
. ~/.bash_functions
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
HISTTIMEFORMAT="%F %T"
HISTIGNORE='&:[ ]*'
HISTFILESIZE=2000
export BROWSER="w3m"
export EDITOR="nano"
export VISUAL=$EDITOR
export PAGER="/usr/bin/less"
export LESSCHARSET="utf8"
export LESSOPEN="|/usr/bin/lesspipe %s 2>&-"
export LESS="-i -N -w	-z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%: ?lbLine %lb:?bbByte %bb:-..."
export NICKNAME="Jalus"
export HOSTFILE="/etc/hosts"
export PATH="$PATH:~/bin"
export INPUTRC="~/.inputrc"
PS1="\[\033[0;37m\]\[[\033[0;36m\]\u\[\033[0;37m\]]\342\224\200[\[\033[0;31m\]\h\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[0m\]"
#function __setprompt
#{
#	local LAST_COMMAND=$?
#	local LIGHTGRAY="\033[0;37m"
#	local WHITE="\033[1;37m"
#	local BLACK="\033[0;30m"
#	local DARKGRAY="\033[1;30m"
#	local RED="\033[0;31m"
#	local LIGHTRED="\033[1;31m"
#	local GREEN="\033[0;32m"
#	local LIGHTGREEN="\033[1;32m"
#	local BROWN="\033[0;33m"
#	local YELLOW="\033[1;33m"
#	local BLUE="\033[0;34m"
#	local LIGHTBLUE="\033[1;34m"
#	local MAGENTA="\033[0;35m"
#	local LIGHTMAGENTA="\033[1;35m"
#	local CYAN="\033[0;36m"
#	local LIGHTCYAN="\033[1;36m"
#	local NOCOLOR="\033[0m"
#	if [[ $LAST_COMMAND != 0 ]]; then
#		PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
#		if [[ $LAST_COMMAND == 1 ]]; then
#			PS1+="General error"
#		elif [ $LAST_COMMAND == 2 ]; then
#			PS1+="Missing keyword, command, or permission problem"
#		elif [ $LAST_COMMAND == 126 ]; then
#			PS1+="Permission problem or command is not an executable"
#		elif [ $LAST_COMMAND == 127 ]; then
#			PS1+="Command not found"
#		elif [ $LAST_COMMAND == 128 ]; then
#			PS1+="Invalid argument to exit"
#		elif [ $LAST_COMMAND == 129 ]; then
#			PS1+="Fatal error signal 1"
#		elif [ $LAST_COMMAND == 130 ]; then
#			PS1+="Script terminated by Control-C"
#	        elif [ $LAST_COMMAND == 131 ]; then
#	                PS1+="Fatal error signal 3"
#	        elif [ $LAST_COMMAND == 132 ]; then
#	                PS1+="Fatal error signal 4"
#	        elif [ $LAST_COMMAND == 133 ]; then
#	                PS1+="Fatal error signal 5"
#	        elif [ $LAST_COMMAND == 134 ]; then
#	                PS1+="Fatal error signal 6"
#	        elif [ $LAST_COMMAND == 135 ]; then
#			PS1+="Fatal error signal 7"
#	        elif [ $LAST_COMMAND == 136 ]; then
#	                PS1+="Fatal error signal 8"
#	        elif [ $LAST_COMMAND == 137 ]; then
#	                PS1+="Fatal error signal 9"
#	        elif [ $LAST_COMMAND -gt 255 ]; then
#	                PS1+="Exit status out of range"
#	        else
#	                PS1+="Unknown error code"
#	        fi
#		PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
#	else
#	        PS1=""
#	fi
#	PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')"
#	PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-"
#	PS1+="(\[${MAGENTA}\]CPU $(cpu)%"
#	PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"
#	PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"
#	PS1+="\[${DARKGRAY}\])-"
#	PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"
#	PS1+="(\[${GREEN}\]$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')\[${DARKGRAY}\]:"
#	PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"
#	PS1+="\n"
#	PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "
#	PS3="Please enter a number from above list: "
#	PS4="\[${DARKGRAY}\]+\[${NOCOLOR}\] "
#}
XDG_CONFIG_HOME="~/.config"
LIGHTGRAY="\033[0;37m"
CYAN="\033[0;36m"
LIGHTCYAN="\033[1;36m"
GRAY="\[\033[1;30m\]"
PS2="$LIGHT_CYAN>$CYAN>$GRAY>$LIGHT_GRAY "
PS3="Please enter a number from above list: "
PS4="\[${DARKGRAY}\]+\[${NOCOLOR}\] "
echo "####################################################"
echo -ne "Quote of the terminal:"
echo
fortune
echo "####################################################"
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
