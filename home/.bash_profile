. ~/.bashrc
if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

[[ -z $DISPLAY && $TERM = "linux" && $(tty) = /dev/tty1 ]] && exec tmux
[[ -z $DISPLAY && $TERM = "linux" && $(tty) = /dev/tty1 ]] && exec weechat
[[ -z $DISPLAY && $TERM = "linux" && $(tty) = /dev/tty1 ]] && exec startx

export BROWSER="$HOME/.scripts/linkhandler"
export TRUEBROWSER="/usr/bin/firefox"
export EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR
export PAGER="/usr/bin/less"
