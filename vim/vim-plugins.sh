#!/bin/bash
# A script to install vim plugins
WORKDIR=$(pwd)
VIM_CONFIG="$HOME/.vim"

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

echo "Installing color schemes"
if [[ ! -e "$VIM_CONFIG/colors/molokai.vim" ]]; then
  pushd $VIM_CONFIG/colors
  curl -fsSL https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> molokai.vim
  popd
fi

echo "Installing vim utilities"
pushd $VIM_CONFIG/bundle
if [[ ! -d "./nerdtree" ]]; then
  echo "Installing NERDTree"
  git clone https://github.com/preservim/nerdtree.git
fi
if [[ ! -d "./vim-airline" ]]; then
  echo "Installing vim-airline"
  git clone https://github.com/vim-airline/vim-airline
fi

echo "Installing vim development plugins"
if [[ ! -d "./ale" ]]; then
  git clone https://github.com/dense-analysis/ale
fi
if [[ ! -d "./vim-gitgutter" ]]; then
  git clone https://github.com/airblade/vim-gitgutter
fi
if [[ ! -d "./vista.vim" ]]; then
  git clone https://github.com/liuchengxu/vista.vim
fi
if [[ ! -d "./typescript-vim" ]]; then
  git clone https://github.com/leafgarland/typescript-vim
fi
if [[ ! -d  "./vim-jsx-typescript" ]]; then
  git clone https://github.com/peitalin/vim-jsx-typescript
fi
if [[ ! -d "./coc.nvim" ]]; then
  git clone https://github.com/neoclide/coc.nvim
fi

echo "Installing dependencies for coc.nvim"
pushd coc.nvim 
yarn install
# Exit coc.nvim dir
popd
echo "Done!"
# exit .vim/bundle dir
popd
exit 0

