# shutdown
alias bye='sudo shutdown -h now'
alias reboot='sudo reboot'
# java alias
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
# move
#alias up='cd ..'
#alias upp='cd ../..'
#alias uppp='cd ../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# cp confirm
alias cp='cp -i'
# git alias
alias g='git'
# svn alias
alias s='svn'
# ls
alias ls='ls -F --color' la='ls -a --color' ll='ls -lah --color'
# g++
alias gpp='g++'
# tmux
alias tm='tmux'
alias tma='tmux attach'
alias tma0='tmux attach -t 0'
alias tma1='tmux attach -t 1'
alias tma2='tmux attach -t 2'
alias tml='tmux list-sessions'
#rake 遅い
alias rake='noglob rake'
compdef -d rake
alias raspi='ssh -p 2682 tsubone@raspi'
alias sakura='ssh -p 2411 tsubone@sakura'
alias less='less -MN'
