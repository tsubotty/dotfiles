#! /bin/bash

echo "以下のファイルが${HOME}に配置されます"
echo ".zsh .zshrc .zshenv .zsh_profile .emacs.d .gemrc .gitconfig .vimrc .gvimrc .vim .vimperatorrc .muttrc .screenrc .tmux.conf"
if expr "$OSTYPE" : "darwin*" > /dev/null; then
    echo "private.xmlが$HOME/Library/Application\ Support/KeyRemap4MacBook/に配置されます"
fi
echo "全て上書き（1）, 既存の物は残す（2）, 中止（それ以外）"

read ans
DOT_FILES=( .zshrc .zshenv .zsh_profile .emacs.d .gemrc .gitconfig .vimrc .gvimrc .vim .vimperatorrc .muttrc .screenrc .tmux.conf)
if [ "$ans" = "1" ]; then
    for file in ${DOT_FILES[@]}
    do
        ln -sf $HOME/dotfiles/$file $HOME/$file
    done
    if expr "$OSTYPE" : "darwin*" > /dev/null; then
        ln -sf $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml
    fi
elif [ "$ans" = "2" ]; then
    for file in ${DOT_FILES[@]}
    do
        ln -s $HOME/dotfiles/$file $HOME/$file
    done
    if expr "$OSTYPE" : "darwin*" > /dev/null; then
        ln -s $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml
    fi
else
    echo "setup has cancelled"
fi

echo "Intalling oh-my-zsh to ${HOME} ...."
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

for file in `ls -la $HOME/dotfiles/my_zsh_custom`
do
    ln -sf $file $HOME/.oh-my-zsh/custom/$file
done

echo "Vimプラグイン:NeoBundleのインストールを行いますか？（y/n）"
read ans

if [ $ans = "y" ]; then
    mkdir $HOME/dotfiles/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim.git $HOME/dotfiles/.vim/bundle/neobundle.vim
fi
