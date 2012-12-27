case "${OSTYPE}" in
    linux*)
        if [ -x /usr/bin/vim ]; then
            export EDITOR=/usr/bin/vim
            export VISUAL=/usr/bin/vim
        fi
        # apt alias
        alias agup='sudo apt-get update && sudo apt-get dist-upgrade'
        alias rem='sudo apt-get autoremove'
        alias cl-'sudo apt-get autoclean'
        alias ag='apt-get'
        alias ac='apt-cache'
        alias agi='sudo apt-get install'
        alias acs='apt-cache search'
        alias agr='sudo apt-get remove' #特定パッケージの削除
        alias agp='sudo apt-get purge' #特定パッケージの設定ファイルを含めた削除
        
        compdef -d apt-get
        compdef -d apt-cache

        # aptitude alias
        alias atup='sudo aptitude update && sudo aptitude safe-upgrade'
        alias at='aptitude'
        alias ats='aptitude search'
        alias ati='sudo aptitude install'
        alias atr='sudo aptitude remove'
        alias atp='sudo aptitude purge'
        
        compdef -d aptitude

        alias vi='vim'
        alias E='emacsclient -t'
        alias kill-emacs="emacsclient -e '(kill-emacs)'"
        
        if which trash-put &>/dev/null; then
            alias rm='trash-put'
        fi
        ;;
esac
