## Emacs Aliases for Eshell
#alias ll 'ls -l $*'
#alias emacs '-nw --color=never find-file $1'
#alias w3m 'w3m-find-file $1'
#alias clear recenter 0


# some more ls aliases
# taken from the LinuxNoob forums
alias startx="startx -- vt1 -keeptty > ~/.xorg.log 2>&1"
alias st='stterm # -f <font name> -g <geometry>'

alias upd='sudo apt-get update'
alias upg='sudo apt-get update && sudo apt-get upgrade'
alias purge='sudo apt-get purge'
alias brc='nano ~/.bashrc'
alias search='apt-cache search'
alias policy='apt-cache policy'
alias depends='apt-cache depends'
alias ins='sudo apt-get install'

## Space on drive
alias disk='du -S | sort -n -r |more'

# search
alias where="which"
alias what="apropos"
alias apr="apropos"
alias ff="find . -type f -name"

# navigation
#alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../../"
alias ......="cd ../../../../.."
alias fonts="cd /usr/share/fonts"
alias scripts="cd $HOME/.scripts"

#### SAFETY ####
alias rm='rm -Iv --preserve-root'
#alias mv='mv -iv'
#alias cp='cp -iv'
alias ln='ln -i'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias shred='shred -n 100 -z -v -u'

#### REBOOT/SHUTDOWN ####
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# alias to install iceweasel aurora - safe to remove after use
#alias alpha='sudo apt-get update && sudo apt-get install -t experimental iceweasel'


alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -l'

alias grep='grep --color=auto'

alias md='mkdir -p -v'
alias rd='rmdir -v'

alias manb='man -H'
alias gc="gcc -Wall"
alias bot="cd $(dirname $(find . | tail -1))"
alias clr="cd && clear"
alias cl="clear"
alias k="killall"
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
alias reboot="sudo reboot"
alias halt="sudo halt"
alias up="cd .."
