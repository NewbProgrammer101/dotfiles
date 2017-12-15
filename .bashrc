alias k="killall"
alias grep="grep --color=always"
alias a10="ssh -p 2222 a10"
alias cal="calcurse"
alias mkdir="mkdir -pv"
alias ping="ping -c 3"
alias gcl="git clone"
alias gcs="git co"
alias gu="git push"
alias ga="git add -A"
alias gpu="git pull"
alias reboot="sudo reboot"
alias halt="sudo halt"
alias emerge="sudo emerge -avDuN"
alias up="cd .."
. /usr/libexec/mc/mc.sh
export MAIL="~/Mail/countolaf17@gmail.com/INBOX"
export HISTSIZE=2000
export HISTCONTROL=ignoreboth
export VISUAL=$EDITOR
export PAGER="/usr/bin/less"
export NICKNAME="Jalus"
PS1="\[\033[0;37m\]\[[\033[0;36m\]\u\[\033[0;37m\]]\342\224\200[\[\033[0;31m\]\h\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[0m\]"
echo
echo -ne "Good day $NICKNAME! it's "; date '+%A, %B %-d %Y'
echo "####################################################"
echo -ne "Finally, your daily Fortune:"
echo
fortune
echo "####################################################"