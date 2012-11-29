# apt alias
if [ -x /usr/bin/vim ]; then
    export EDITOR=/usr/bin/vim
    export VISUAL=/usr/bin/vim
fi
alias agup='sudo apt-get update && sudo apt-get dist-upgrade'
alias rem='sudo apt-get autoremove'
alias cl-'sudo apt-get autoclean'
alias ag='apt-get'
alias ac='apt-cache'
alias agi='sudo apt-get install'
alias acs='apt-cache search'
alias agr='sudo apt-get remove' #特定パッケージの削除
alias agp='sudo apt-get purge' #特定パッケージの設定ファイルを含めた削除

# aptitude alias
alias atup='sudo aptitude update && sudo aptitude safe-upgrade'
alias at='aptitude'
alias ats='aptitude search'
alias ati='sudo aptitude install'
alias atr='sudo aptitude remove'
alias atp='sudo aptitude purge'


export PATH=/var/lib/gems/1.8/bin:$PATH
