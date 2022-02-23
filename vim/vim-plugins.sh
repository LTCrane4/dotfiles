#!/bin/bash
# A script to install vim plugins
WORKDIR=$(pwd)

if [[ -e "$HOME/.vimrc" ]]; then
  echo "Backing up existing vimrc"
  mv $HOME/.vimrc $HOME/.vimrc.bak
fi

echo "Linking .vimrc" 
ln -s $WORKDIR/.vimrc $HOME/.vimrc

echo "Installing pathogen"
if [[ ! -e "$HOME/.vim/autoload/pathogen.vim" ]]; then
  if [[ ! -d "$HOME/.vim/bundle" ]]; then
    mkdir -p $HOME/.vim/{autoload,bundle}
  fi
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

pushd $HOME/.vim/bundle
echo "Installing vim utilities"

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
popd
echo "Done!"
popd
exit 0

