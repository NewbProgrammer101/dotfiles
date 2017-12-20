#case "$-" in
#	*i*) echo "$(date '+%Y-%m-%d_%H:%M:%S_%Z') Interactive" \
#		"~/.bash_profile ssh="$SSH_CONNECTION" >> ~/.logs/rc.log ;;
#	*  ) echo "$(date '+%Y-%m-%d_%H:%M:%S_%Z') Non-interactive" \
#		"~/.bash_profile ssh="$SSH_CONNECTION" >> ~/.logs/rc.log ;;
#esac
export BROWSER="dillo"