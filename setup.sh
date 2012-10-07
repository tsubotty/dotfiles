#!/bin/bash

DOT_FILES=( .zsh .zshrc .emacs.d .gemrc .gitconfig .vimrc .gvimrc .vim .vimperatorrc .muttrc)

for file in ${DOT_FILES[@]}
do
    ln -sn $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/private.xml /Users/tsubone/Library/Application\ Support/KeyRemap4MacBook/private.xml
