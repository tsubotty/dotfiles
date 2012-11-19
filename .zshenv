##PATH
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:$HOME/bin
## TeX用PATH追加
export PATH=/Applications/UpTeX.app/teTeX/bin:${PATH}
##ruby rbenv
if [ -d ~/.rbenv/ ]; then
    eval "$(rbenv init -)"
fi
