#!/bin/bash

cd ${0%/*}
DOTFILES=$(pwd)

VIMRC=~/.vimrc

if ! [[ -f $VIMRC ]]; then
    ln -vs "$DOTFILES/vimrc" $VIMRC
fi

BASH_PROFILE=~/.bash_profile
BASHRC=~/.bashrc

if ! [[ -f "$BASH_PROFILE" ]]; then
    ln -vs "$DOTFILES/bash_profile" "$BASH_PROFILE"
fi

if ! [[ -f "$BASHRC" ]]; then
    touch "$BASHRC"
fi

SOURCE_FUNCTIONS="source $DOTFILES/functions.sh"

if ! grep --quiet "$SOURCE_FUNCTIONS" "$BASHRC"; then
   echo "$SOURCE_FUNCTIONS" >> "$BASHRC"
fi

source "$BASHRC"
