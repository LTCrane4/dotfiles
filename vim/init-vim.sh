#!/bin/bash
# A script to install vim plugins
WORKDIR=$(pwd)
VIM_CONFIG="$HOME/.vim"

# Ensure all files are executable
./check-exec.sh

if [[ -e "$HOME/.vimrc" ]]; then
  echo "Backing up existing vimrc"
  mv $HOME/.vimrc $HOME/.vimrc.bak
fi

echo "Linking .vimrc" 
ln -s $WORKDIR/.vimrc $HOME/.vimrc

if [[ ! -e "$VIM_CONFIG/autoload"  && ! -e "$VIM_CONFIG/bundle" && ! -e "$VIM_CONFIG/colors" ]]; then
  echo "Creating vim plugin directories"
  mkdir -pv $HOME/.vim/{autoload,bundle,colors}
fi

echo "Installing pathogen"
if [[ ! -e "$VIM_CONFIG/autoload/pathogen.vim" ]]; then
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

./vim-colors.sh
./vim-plugins.sh
./vim-coc.sh

echo "Done!"
exit 0

