#!/bin/bash

cd ${0%/*}
DOTFILES=$(pwd)
ln -vs "$DOTFILES/vimrc" ~/.vimrc
