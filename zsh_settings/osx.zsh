case "${OSTYPE}" in
    darwin*)
        if [ -x /Applications/MacVim.app/Contents/MacOS/Vim ]; then
            export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
            export VISUAL=/Applications/MacVim.app/Contents/MacOS/Vim
            export TEXLOCAL=/usr/local/texlive/texmf-local/tex/latex/local
            alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
            alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        fi
        # English man
        alias eman='env LANG=C man'
        # osx alias
        alias pbc='pbcopy'
        alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw "$@"'
        alias E='/Applications/Emacs.app/Contents/MacOS/Emacs -nw "$@"'
        #alias gdb='/usr/bin/gdb' #gdb7.5が微妙なのでデフォルトのgdbを使ってる
        alias locateupdate='sudo /usr/libexec/locate.updatedb'
        ## Homebrew ##
        alias b='brew'
        alias bs='brew -S'
        alias bi='brew info'
        alias bl='brew list'
        alias bh='brew home'
        alias bopt='brew options'
        alias bout='brew outdated'
        alias bup='brew update'
        alias bupg='brew upgrade'
        alias opbr='open $(brew --prefix)/'
        alias cdbr='pushd $(brew --prefix)/'
        # tmux
        # alias tmux='tmuxx'
        # alias tm='tmuxx'
        alias tma='tmux attach'
        alias tml='tmux list-window'
        alias tm='/usr/local/bin/tmux'
        alias tmux='/usr/local/bin/tmux'
        # Application
        alias safari='open -g -a Safari'
        alias chrome='open -g -a Google\ Chrome'
        alias firefox='open -g -a Firefox'
        alias subl="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"
        alias o='open'

        alias wakeubuntu='VBoxManage startvm ~/VirtualBox\ VMs/Ubuntu/Ubuntu.vbox'
        alias tsubone='ssh -l tsubone'

        alias rm='rmtrash'
        alias vmrun_ubuntu='/Applications/VMware\ Fusion.app/Contents/Library/vmrun start ~/VMware/Ubuntu.vmwarevm'
        alias vmrun_windows='/Applications/VMware\ Fusion.app/Contents/Library/vmrun start ~/VMware/Windows7.vmwarevm'

        alias img="wget_url.sh"
        
        # GNU commands
        alias tar='gtar'
        alias find='gfind'
        alias xargs='gxargs'
        ;;
esac
