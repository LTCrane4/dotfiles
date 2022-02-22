#!/bin/bash
# A script to install vim plugins
WORKDIR=$(pwd)

if [[ -e "$HOME/.vimrc" ]]; then
  echo "Backing up existing vimrc"
  mv $HOME/.vimrc $HOME/.vimrc.bak
  ln -s $WORKDIR/.vimrc $HOME/.vimrc
fi

echo "Installing pathogen"
mkdir -p $HOME/.vim/{autoload,bundle}
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd $HOME/.vim/bundle
echo "Installing vim utilities"
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/vim-airline/vim-airline

echo "Installing vim development plugins"
git clone https://github.com/dense-analysis/ale
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/liuchengxu/vista.vim
git clone https://github.com/leafgarland/typescript-vim
git clone https://github.com/peitalin/vim-jsx-typescript
git clone https://github.com/neoclide/coc.nvim

echo "Installing dependencies for coc.nvim"
cd coc.nvim && yarn install
cd
echo "Done!"
exit 0

