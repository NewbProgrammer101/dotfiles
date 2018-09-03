# Generic aliases
#alias tmux="tmux -2"
#alias upd='sudo emerge --sync'
alias purge='sudo apt-get purge'
alias brc='nano ~/.bashrc'
alias search='apt search'
alias ins='sudo apt-get install'
alias ssh="ssh_with_bash"
alias autorem="sudo apt-get autoremove"
alias sha1="openssl sha1"
alias sshd="sudo service sshd start"
alias sudo="sudo "

## Maintainence/stuff
alias disk='du -S | sort -n -r |more'
alias folders="du -h --max-depth=1"
alias foldersort="find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn"
alias tree="tree -CAhFs --dirsfirst"
alias df="df -HT -x tmpfs -x usbfs -x devtmpfs"
#alias sway="sway -d 2>~/.logs/sway.log"
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias sizeof="du -sh"
alias extundelete-d='sudo extundelete "$1" --restore-directory "$2"'
alias extundelete-f='sudo extundelete "$1" --restore-files "$2"'
alias extundelete-r='sudo extundelete "$1" --restore-all'
alias extundelete-sda='sudo extundelete /dev/sda --restore-all'
alias extundelete-sda-d='sudo extundelete /dev/sda --restore-directory "$1"'
alias extundelete-sda-f='sudo extundelete /dev/sda --restore-files "$1"'
alias hdinfo='hdparm -i[I] /dev/sda'
alias etcup="sudo etc-update"
alias euse="sudo euse"
alias eqf="equery f"
alias equ="equery u"
alias eqh="equery h"
alias eqa="equery a"
alias eqb="equery b"
alias eql="equery l"
alias eqd="equery d"
alias eqg="equery g"
alias eqc="equery c"
alias eqk="equery k"
alias eqm="equery m"
alias eqy="equery y"
alias eqs="equery s"
alias eqw="equery w"
alias acpi="acpi -V"
alias lspci="sudo lspci -nnk"

# search
alias where="which"
alias what="apropos"
alias apr="apropos"
alias ff="find . -type f -name"
alias searchdesc="emerge --searchdesc"

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
alias printkeys="gpg --fingerprint"
alias mykeys="gpg --list-keys"

#### REBOOT/SHUTDOWN ####
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# My aliases
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -AF'
alias ll='ls -l'
alias sl=ls
alias l=ls
alias edit="nano"
alias grep='grep --color=always -ir'
alias md='mkdir -p -v'
alias rd='rmdir -v'
alias gc="gcc -Wall"
alias bot="cd $(dirname $(find . | tail -1))"
alias clr="cd && clear"
alias cl="clear"
alias ka="killall"
alias cp="cp -ivr"
alias mv="mv -iv"
alias ren="mv"
alias rm="rm -rf"
alias a10="ssh -p 2222 a10"
alias cal="calcurse"
alias mkdir="mkdir -pv"
alias ping="ping -c 1"
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
alias showallaliases="compgen -A alias"
alias showallfunctions="compgen -A function"
alias iamcow="fortune | cowsay"
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias m=mutt
alias rh="rehash"
alias web="w3m"
alias mann="man"
alias q="exit"
alias back="cd $OLDPWD"
alias documents="cd ~/Documents"
alias pictures="cd ~/Pictures"
alias umount="sudo umount"
alias downloads="cd ~/Downloads"
alias brcupdate=". ~/.bashrc"
alias mkconf="sudo nano /etc/portage/make.conf"
alias pkguse="sudo nano /etc/portage/package.use/package.use"
alias 99bottles='x="bottles of beer";y="on the wall";for b in {99..1};do echo "$b $x $y, $b $x. Take one down pass it around, $(($b-1)) $x $y"; sleep 3;done'
alias lotto='shuf -i 1-49 -n 6 | sort -n | xargs'
alias dns="cat /etc/resolv.conf"
alias hto=htop
alias music="cd ~/Music && cmus"
alias reddit="w3m https://reddit.com"
alias kdocs="cd ~/Documents/Documentation"
alias gccdocs="w3m https://gcc.gnu.org/onlinedocs/gcc-6.4.0/gcc"
alias thop=htop
alias tho=htop
alias genwiki="w3m https://wiki.gentoo.org"
alias balias="n ~/.bash_aliases"
alias github="w3m https://github.com"
alias tetris=bastet
alias wget="wget -c"
alias gd=cd
alias rt=cd
alias news=newsboat
alias free="free -m"
alias frr=free
alias acc="w3m https://github.com/NewbProgrammer101"
alias mpfb='mplayer -vo fbdev -xy 1024 -fs -zoom "$1"'
alias bible=echobible
alias bibl=echobible
alias hotp=htop
alias hop=htop
alias doc=documents
alias ch=cd
alias personal="cd ~/Documents/Personal"
alias r=ranger
alias mplayer="mplayer -loop 0 "
alias mpdf="mupdf-x11"
alias mp=mplayer
