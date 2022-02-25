#!/bin/bash

COLORS="$HOME/.vim/colors"

echo "Installing vim color schemes"
if [[ ! -d "$COLORS" ]]; then
  echo "Creating vim colors dir"
  mkdir -pv $COLORS
fi

if [[ ! -e "$COLORS/molokai.vim" ]]; then
  echo "Installing vim-molokai"
  curl -fsSL https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> molokai.vim
fi

