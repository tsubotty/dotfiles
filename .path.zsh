# PATH config
case "${OSTYPE}" in
    darwin*)
        # my_shell_scripts
        export PATH=${PATH}:${HOME}/ShellScripts
        export PATH=$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin:${PATH}
        export PATH=/usr/local/share/npm/bin:$PATH
        export JAVA_HOME=$(/usr/libexec/java_home)
        export PATH=$PATH:${JAVA_HOME}/bin
        export PATH=$PATH:/usr/texbin
        ;;
    linux*)
        export PATH=/var/lib/gems/1.8/gems/:$PATH
        ;;
esac

export PATH=/usr/local/bin:/usr/local/sbin/:/opt/local/bin:/opt/local/sbin:${PATH}:/usr/bin:/usr/sbin:/bin:/sbin:/opt/X11/bin:$HOME/bin
# 重複リセット
typeset -U path
