# PATH config
case "${OSTYPE}" in
    darwin*)
        # my_shell_scripts
        export PATH=${PATH}:${HOME}/my_shell_scripts
        export PATH=$(brew --prefix coreutils)/libexec/gnubin:${PATH}
        ;;
    linux*)
        export PATH=/var/lib/gems/1.8/gems/:$PATH
        ;;
esac

export PATH=/usr/local/bin:/usr/local/sbin/:/opt/local/bin:/opt/local/sbin:${PATH}:/usr/bin:/usr/sbin:/bin:/sbin:/opt/X11/bin:$HOME/bin
# 重複リセット
typeset -U path
