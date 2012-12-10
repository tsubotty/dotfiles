# PATH config
case "${OSTYPE}" in
    darwin*)
        # TeX用PATH追加
        export PATH=${PATH}:/Applications/UpTeX.app/teTeX/bin
        # my_shell_scripts
        export PATH=${PATH}:${HOME}/my_shell_scripts
        # set vim as default editor
        ;;
    linux*)
        export PATH=/var/lib/gems/1.8/gems/:$PATH
        ;;
esac

export PATH=/usr/local/bin:/usr/local/sbin/:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:$HOME/bin:${PATH}

# zshの設定ファイルを分割する ~/dotfiles/.zsh/の*.zshを読み込む
ZSHHOME="${HOME}/dotfiles/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
    -x $ZSHHOME ]; then
for i in $ZSHHOME/*; do
    [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
done
fi

# 重複リセット？
typeset -U