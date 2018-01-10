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
