#!/bin/bash
# Installs all vim dependencies for the vimrc in this repository
VIM_CONFIG="$HOME/.vim"
PLUGINS="$VIM_CONFIG/bundle"

echo "Installing Vim Plugins"
pushd $PLUGINS
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
if [[ ! -d "./vim-test" ]]; then
  git clone https://github.com/vim-test/vim-test
fi

echo "Successfully installed plugins"
popd
exit 0

