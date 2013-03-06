#! /bin/bash

echo "以下のファイルが${HOME}に配置されます"
echo ".zsh .zshrc .zshenv .zsh_profile .emacs.d .gemrc .gitconfig .vimrc .gvimrc .vim .vimperatorrc .muttrc .screenrc .tmux.conf"
if expr "$OSTYPE" : "darwin*" > /dev/null; then
    echo "private.xmlが$HOME/Library/Application\ Support/KeyRemap4MacBook/に配置されます"
fi
echo "全て上書き（1）, 既存の物は残す（2）, 中止（それ以外）"

read ans
DOT_FILES=( .zshenv .zsh_profile .zsh .emacs.d .gemrc .gitconfig .vimrc .gvimrc .vim .vimperatorrc .muttrc .screenrc .tmux.conf .jshintrc)
if [ "$ans" = "1" ]; then
    ln -sf $HOME/dotfiles/.zshrc.head $HOME/.zshrc
    for file in ${DOT_FILES[@]}
    do
        ln -sf $HOME/dotfiles/$file $HOME/
    done
    if expr "$OSTYPE" : "darwin*" > /dev/null; then
        ln -sf $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml
    fi
elif [ "$ans" = "2" ]; then
    for file in ${DOT_FILES[@]}
    do
        ln -s $HOME/dotfiles/$file $HOME/
    done
    if expr "$OSTYPE" : "darwin*" > /dev/null; then
        ln -s $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml
    fi
else
    echo "setup has cancelled"
fi

# latex
echo "symlink to $HOME/dotfiles/latex_tools is installing"
case $OSTYPE in
    darwin*)
        if [ -e $HOME/Library/texmf/tex/latex ]; then
            ln -s $HOME/dotfiles/latex_tools $HOME/Library/texmf/tex/latex/
        else
            mkdir -p $HOME/Library/texmf/tex/latex
            ln -s $HOME/dotfiles/latex_tools $HOME/Library/texmf/tex/latex/
        fi
        sudo mktexlsr
        ;;
    linux*)
        if [ -e $HOME/texmf/tex/latex ]; then
            ln -s $HOME/dotfiles/latex_tools $HOME/texmf/tex/latex/
        else
            mkdir -p $HOME/texmf/tex/latex
            ln -s $HOME/dotfiles/latex_tools $HOME/texmf/tex/latex/
        fi
        sudo mktexlsr
        ;;
    *) 
        ;;
esac


echo "Intalling oh-my-zsh to ${HOME} ...."
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

cp -f $HOME/dotfiles/misc.zsh $HOME/.oh-my-zsh/lib/  # url-magicに問題があるため自分用の物に置き換え

## oh-my-zsh用 ##
ln -sf $HOME/dotfiles/basic_for_framework.zsh $HOME/.oh-my-zsh/custom/basic_for_framework.zsh
for file in `ls $HOME/dotfiles/zsh_settings`
do
    ln -sf $HOME/dotfiles/zsh_settings/$file $HOME/.oh-my-zsh/custom/$file
done
for file in `ls $HOME/dotfiles/zsh_themes`
do
    ln -sf $HOME/dotfiles/zsh_themes/$file $HOME/.oh-my-zsh/custom/$file
done

echo "Vimプラグイン:NeoBundleのインストールを行いますか？（y/n）"
read ans

if [ $ans = "y" ]; then
    mkdir $HOME/dotfiles/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim.git $HOME/dotfiles/.vim/bundle/neobundle.vim
fi
