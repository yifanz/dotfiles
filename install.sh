#!/bin/bash

cd ${0%/*}
DOTFILES=$(pwd)

ln -vs "$DOTFILES/vimrc" ~/.vimrc

SOURCE_FUNCTIONS="source $DOTFILES/functions.sh"
if ! grep --quiet "$SOURCE_FUNCTIONS" ~/.bashrc; then
   echo "$SOURCE_FUNCTIONS" >> ~/.bashrc
fi
