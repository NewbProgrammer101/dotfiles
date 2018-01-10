# Generic aliases
alias startx="startx -- vt1 -keeptty > ~/.xorg.log 2>&1"
alias st='stterm # -f <font name> -g <geometry>'
alias tmux="tmux -2"
alias upd='sudo emerge --sync'
alias upg='sudo emerge -avDuN @world'
alias purge='sudo emerge --rage-clean'
alias brc='nano ~/.bashrc'
alias search='emerge --search'
alias ins='sudo emerge -av'
alias ssh="ssh_with_bash"
alias autorem="sudo emerge -ac"
alias sha1="openssl sha1"

## Space on drive
alias disk='du -S | sort -n -r |more'
alias folders="du -h --max-depth=1"
alias foldersort="find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn"
alias tree="tree -CAhF --dirsfirst"
alias treed="tree -CAFd"
alias df="df -HT"
alias sway="sway -d 2>~/.logs/sway.log"
alias startx="startx -- vt1 -keeptty > ~/.logs/xorg.log 2>&1"
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# search
alias where="which"
alias what="apropos"
alias apr="apropos"
alias ff="find . -type f -name"

# navigation
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../../"
alias ......="cd ../../../../.."
alias fonts="cd /usr/share/fonts"
alias scripts="cd $HOME/.scripts"

#### SAFETY & SECURITY ####
alias rm='rm -Ivrf --preserve-root'
alias ln='ln -isv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias shred='shred -n 100 -z -v -u'
alias exportallkeys="exportmykeys_private && exportmykeys_public"
alias printmykeys="gpg --fingerprint"
alias mykeys="gpg --list-keys && gpg --list-secret-keys"

#### REBOOT/SHUTDOWN ####
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# My aliases
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -AF'
alias ll='ls -l'
alias sl=ls
alias edit="nano"
alias grep='grep --color=auto'
alias md='mkdir -p -v'
alias rd='rmdir -v'
alias gc="gcc -Wall"
alias bot="cd $(dirname $(find . | tail -1))"
alias clr="cd && clear"
alias cl="clear"
alias ka="killall"
alias cp="cp -iv"
alias mv="mv -iv"
alias ren="mv"
alias rm="rm -rf"
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
alias up="cd .."
alias n="nano"
alias v="vim"
alias ve="vim .vimrc"
alias sv="sudo vim"
alias sn="sudo nano"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ps="ps auxf"
alias less="less -R"
alias execu="chmod a+x"
alias 000="chmod -R 000"
alias 644="chmod -R 644"
alias 666="chmod -R 666"
alias 755="chmod -R 755"
alias 777="chmod -R 777"
alias h="history |grep "
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
alias checkcommand="type -t"
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias iftop="sudo iftop -i enp9s0"
alias shtop="sudo htop"
alias openports="netstat -nape --inet"
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
alias hlp="man bash"
alias swapfile="sudo dd if=/dev/zero of=swapfile.swp bs=2048 count=1M && sudo mkswap swapfile.swp && sudo swapon swapfile.swp"
alias lvim="vim -c \"normal '0\""
alias gutenberg="w3m http://gutenberg.org"
alias ddg="w3m https://ddg.gg/lite"
alias tcp="sudo netstat -atp"
