# shutdown
alias bye='sudo shutdown -h now'
alias reboot='sudo reboot'
# java alias
# alias javac='javac -J-Dfile.encoding=UTF-8'
# alias java='java -Dfile.encoding=UTF-8'
# move
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias pu='pushd'
alias po='popd'
# cp confirm
alias cp='cp -i'
# git alias
alias g='git'
alias gad='git add -A'
alias gst='git status'
alias gdf='git diff'
alias gci='git commit -a'
alias gcim='git commit -am'
alias gbr='git branch -avv'
alias gco='git checkout'
alias gft='git fetch'
alias gr='git remote -v'
alias gcl='git clone'
alias gl='git log'
alias glp='git log -p'
alias glo='git log --oneline'
alias gls='git log --stat'
alias gpullr='git pull --rebase'
alias gsw='git checkout -'
# svn alias
alias s='svn'
# ls
alias ls='ls -F --color' ll='ls -ah --color' la='ls -lah --color' lt='ls -laht --color'
# g++
# alias gpp='g++'
alias gpp="g++ -std=c++11 -Wall -O2"
# tmux
# alias tm='tmux'
alias tma='tmux attach'
alias tma0='tmux attach -t 0'
alias tma1='tmux attach -t 1'
alias tma2='tmux attach -t 2'
alias tml='tmux list-sessions'
#rake 遅い
alias rake='noglob rake'
compdef -d rake
alias globalip='wget -q http://info.ddo.jp/remote_addr.php -O - | grep REMOTE_ADDR | cut -c 13-'
alias less='less -MN'
alias hist='history'
#github
# function git() {hub "$@"}
alias hb='hub browse'
alias hcl='hub clone'
alias hcr='hub create'
alias hpr='hub pull-request'

compdef -d make
compdef -d svn
compdef -d scp
compdef -d git
