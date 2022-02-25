#!/bin/bash
# Installs COC and COC plugins for vim

CONFIG="$HOME/.vim"
PLUGIN="$CONFIG/bundle"

pushd $PLUGIN
echo "Installing COC"
if [[ ! -d "$PLUGIN/coc.nvim" ]]; then
  git clone https://github.com/neoclide/coc.nvim
fi

echo "Installing COC dependencies"
pushd coc.nvim
yarn install
popd
echo "Installed COC dependencies"
popd
exit 0

