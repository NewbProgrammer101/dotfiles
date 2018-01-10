# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
iatest=$(expr index "$-" i)
. /usr/libexec/mc/mc.sh
export MARKPATH=$HOME/.marks
cd () {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}
function allips() {
	ifconfig | awk '/inet / {sub(addr:/, "", $2); print $2}'
}
function anagrams() {
cat > "/tmp/anagrams.py" <<"EOF"
#!/usr/bin/python
infile = open ("/usr/share/dict/words", "r")
words_in = infile.readlines()
scrambled = raw_input("Enter the scrambled word: ")
scrambled = scrambled.lower()
scrambled_list = list(scrambled)
scrambled_list.sort()
for word in words_in:
	word_list = list(word.strip().lower())
	word_list.sort()
	if word_list == scrambled_list:
		print(word, scrambled)
EOF
chmod +x "/tmp/anagrams.py"
"/tmp/anagrams.py" "$1"
rm "/tmp/anagrams.py"
}
#function exportmykeys_private() {
#	gpg --list-secret-keys
#	echo -n "Please enter the appropriate private key...
#	Look for the line that starts with something like "sec 1024D/".
#	The part after the 1024D is the key-id.
#	...like this: '2942FE31"...
#	"
#	read MYKEYPRIV
#	gpg -ao Private_Keys-private.key --export-secret-keys "$MYKEYPRIV"
#	echo -n "All done."
#}
#function exportmykeys_public() {
#	gpg --list-keys
#	echo -n "Please enter the appropriate public key...
#	Look for the line that starts with something like "pub 1024D/".
#	The part after the 1024D is the public key-id.
#	...like this: '2942FE31'...
#	"
#	read MYKEYPUB
#	gpg -ao Public_Keys-public.key --export "$MYKEYPUB"
#	echo -n "All done."
#}
function grepcolor {
	cat /dev/urandom | hexdump -C | grep "ca fe"
}
function normal2unix {
	echo "${@}" | awk '{print mktime($0)}';
}
function unix2normal {
	echo $1 | awk '{print strftime("%Y-%m-%d %H:%M:%S",$1)}';
}
function archwikisearch {
	cd ~/Documents/html
	for i in $(grep -li $1 *)
	do
		STRING=`grep -m1 -o 'wgTitle = "[[:print:]]\+"' $i`
		LEN=${#STRING}
		let LEN=LEN-12
		STRING=${STRING:11:LEN}
		LOCATION="~/Documents/html/$i"
		echo -e " \E[33m$STRING    \E[37m$LOCATION"
	done
}
function md5()
{
	echo -n $@ | md5sum
}
function natdebt {
	watch -n 10 "wget -q http://www.brillig.com/debt_clock -O - | grep debtiv.gif | sed -e 's/.*ALT=\"//' -e 's/\".*//' -e 's/ //g'"
}
function pwdtail {
	pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}
function copy {
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}
function ftext {
	grep -iIHrn --color=always "$1" . | less -r
}
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
#function ssh_with_bash {
#	echo -en "\033]2;$@\007"
#	if [[ "$@" == *sun* ]]; then
#		ssh -x "$@" -t 'exec bash -c "exec bash --rcfile <echo \"
#		. /etc/profile;
#		. ~/.bash_profile;
#		export TERM=xterm;
#		export PAGER="which less';
#		co1=\\\"\[\e[48;5;16m\]\[\e[38;5;19m\]\\\";
#		co2=\\\"\[\e[48;5;18m\]\[\e[1m\]\[\e[28;5;7m\]\\\";
#		co3=\\\"\[\e[48;5;16m\]\[\e[38;5;76m\]\\\";
#		co4=\\\"\[\e[48;5;16m\]\[\e[38;5;47m\]\\\";
#		co5=\\\"\[\e[48;5;16m\]\[\e[1m\]\[\e[38;5;23m\]\\\";
#		cc1=\\\"\[\e[0m\]\\\";
#		echo -en \\\"\e[48;5;16m\e[38;5;19m\\\";
#		uptime;
#		alias vim=\\\"TERM=xtermc vim -u /var/tmp/vimrc\\\";
#		alias lsd='\''ls -ltrh |perl -e '\''\'\'''\''
#		while(<>){
#			my \\\$c;
#			if(/^d/){
#				\\\$c=\\\"\e[48;5;18m\\\";
#			} elsif(/^-..x/){
#				\\\$c=\\\"\e[38;5;35m\\\";
#			} elsif(/\.(zip|gz|bz2)\\\$/){
#				\\\$c=\\\"\e[38;5;26m\\\";
#			} elsif(/^l/){
#				\\\$c=\\\"\e[38;5;28m\\\";
#			}
#			\\\$c&&s/^((\S+\s+){8})(.*)/\1\\\$c\3\e\[0m/g;
#			print \\\"\\\$_\\\";
#		}
#		'\''\'\'''\'''\'';
#		set_b_p() {
#			DATEPR=\\\$(date \\\"+%y%m%d.%H%M%S\\\");
#			PS1=\\\"\\\${co1}\\\${DATEPR}\\\${cc1} \\\${co4}\u\\\${cc1}@\\\${co5}\h\\\${cc1} \\\${co2}\w\\\${cc1} \\\${co3}#\\\${cc1} \\\";
#		};
#		PROMPT_COMMAND=set_b_p;
#		\")"'
#	else
#		ssh -X "$@"
#	fi
#}

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
. ~/.bash_aliases
#include ~/.bash_functions
#    . ~/.bash_functions
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
export EDITOR="nano"
export VISUAL=$EDITOR
export PAGER="/usr/bin/less"
export LESSCHARSET="utf8"
export LESSOPEN="|/usr/bin/lesspipe %s 2>&-"
export LESS="-i -N -w	-z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%: ?lbLine %lb:?bbByte %bb:-..."
export NICKNAME="Brian"
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
PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "
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
## Programming completion section
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
function _expand() {
	[ "$cur" != "${cur%\\}" ] && cur="$cur\\";
	if [[ "$cur" == \~*/* ]]; then
		return 0
	else
		if [[ "$cur" == \~* ]]; then
			cur=${cur#\~};
			COMPREPLY=($( compgen -P '~' -u $cur ));
			return ${#COMPREPLY[@]};
		fi;
	fi
}

function _get_longopts() {
	$1 --help | grep -o -e "--[^[:space:].,]*" | grep -e "$2" | sort -u
}

function _killall() {
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $( /usr/bin/ps -u $USER -o comm  | \
		sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
		awk '{if ($0 ~ /^'$cur'/) print $0)' ))
	return 0
}
complete -F _killall killall killps

function _longopts() {
	local cur
	cur=${COMP_WORDS[COMP_CWORD]}
	case "${cur:-*}" in
		-*)	;;
		 *)	return ;;
	esac
	case "$1" in
		\~*)	eval cmd="$1" ;;
		  *)	cmd="$1" ;;
	esac
	COMPREPLY=( $(_get_longopts ${1} ${cur} ) )
}
complete -o default -F _longopts configure bash
complete -o default -F _longopts wget id info a2ps ls recode

function _make() {
	local mdef makef makef_dir="." makef_inc gcmd cur prev i;
	COMPREPLY=();
	cur=${COMP_WORDS[COMP_CWORD]};
	prev=${COMP_WORDS[COMP_CWORD-1]};
	case "$prev" in
		-*f)
			COMPREPLY=($(compgen -f $cur ));
			return 0
		;;
	esac;
	case "$cur" in
		-*)
			COMPREPLY=($(_get_longopts $1 $cur ));
			return 0
		;;
	esac;
	if [ -f ${makef_dir}/GNUmakefile ]; then
		makef=${makef_dir}/GNUmakefile
	elif [ -f ${makef_dir}/makefile ]; then
		makef=${makef_dir}/makefile
	elif [ -f ${makef_dir}/Makefile ]; then
		makef=${makef_dir}/Makefile
	else
		makef=${makef_dir}/*.mk
	fi
	for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
		if [[ ${COMP_WORDS[i]} == -f ]]; then
			eval makef=${COMP_WORDS[i+1]}
			break
		fi
	done
	[ ! -f $makef ] && return 0
	makef_inc=$( grep -E '^-?include' $makef | \
	sed -e "s,^.* ,"$makef_dir"/," )
	for file in $makef_inc; do
		[ -f $file ] && makef="$makef $file"
	done
	if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi
	COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=|$/ \
				    {split($1,A,/ /); for(i in A)print A[i]}' \
				    $makef 2>/dev/null | eval $gcmd ))
}
complete -F _make -X '+($*|*.[cho])' make gmake pmake \

function _meta_comp() {
	local cur func cline cspec
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	cmdline=${COMP_WORDS[@]}
	if [ $COMP_CWORD = 1 ]; then
		COMPREPLY=( $( compgen -c $cur ) )
	else
		cmd=${COMP_WORDS[1]}
		cspec=$( complete -p ${cmd} )
		cline="${COMP_LINE#$1 }"
		COMP_WORDS=( $cline )
		COMP_CWORD=$(( $COMP_CWORD - 1 ))
		if [ -z $cur ]; then 
			COMP_WORDS[COMP_CWORD]=""  ;
		fi
		if [ "${cspec%%-F *}" != "${cspec}" ]; then
			func=${cspec#*-F }
			func=${func%% *}
			eval $func $cline
		else
			func=$( echo $cspec | sed -e 's/^complete//' -e 's/[^ ]*$//' )
		fi
	fi
}
complete -o default -F _meta_comp nohup \
eval exec trace truss strace sotruss gdb
complete -o default -F _meta_comp command type which man nice time

function _tar() {
	local cur ext regex tar untar
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	case "$cur" in
		-*)	COMPREPLY=( $(_get_longopts $1 $cur ) ); return 0;;
	esac
	if [ $COMP_CWORD -eq 1 ]; then
		COMPREPLY=( $( compgen -W 'c t x u r d A' -- $cur ) )
		return 0
	fi
	case "${COMP_WORDS[1]}" in
		?(-)c*f)
			COMPREPLY=( $( compgen -f $cur ) )
			return 0
			;;
			+([^Izjy])f)
			ext='tar'
			regex=$ext
			;;
		*z*f)
			ext='tar.gz'
			regex='t\(ar\.\)\(gz\|Z\)'
			;;
		*[Ijy]*f)
			ext='t?(ar.)bz?(2)'
			regex='t\(ar\.\)bz2\?'
			;;
		*)
			COMPREPLY=( $( compgen -f $cur ) )
			return 0
			;;
	esac
	if [[ "$COMP_LINE" == tar*.$ext' '* ]]; then
		tar=$( echo "$COMP_LINE" | \
			sed -e 's|^.*\([^ ]*'$regex'\) .*$|\1|' )
		untar=t${COMP_WORDS[1]//[^Izjyf]/}
		COMPREPLY=( $( compgen -W "$( echo $( tar $untar $tar \
			2>/dev/null ) )" -- "$cur" ) )
		return 0
	else
		COMPREPLY=( $( compgen -G $cur\*.$ext ) )
	fi
	return 0
}
complete -F _tar -o default tar
complete -W "$( echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh
