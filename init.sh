# !/bin/bash
# A simple script that will back up and symlink dotfiles into the user's home directory

BASHRC=~/.bashrc
BASH_PROFILE=~/.bash_profile

if [[ -e "$BASHRC" ]]; then
  echo "Backing up existing .bashrc"
  mv ~/.bashrc ~/.bashrc.bak
fi

# Symlink bashrc
echo "Symlinking .bashrc"
ln -s ./.bashrc ~/.bashrc

if [[ -e "$BASH_PROFILE" ]]; then
  echo "Moving existing .bash_profile"
  mv ~/.bash_profile ~/.bash_profile.bak
fi

echo "Symlinking .bash_profile"
ln -s ./.bash_profile ~/.bash_profile

echo "Checking vim installation"
if [[ -e $(which vim) ]]; then
  echo "Vim install found!"
  if [[ -e "~/.vimrc" ]]; then
    echo "Backing up existing .vimrc"
    mv ~/.vimrc ~/vimrc.bak
  fi

  ln -s ./vimrc ~/.vimrc
else
  echo "No vim install detected.  Please install vim and try again"
fi

