# !/bin/bash
# A simple script that will symlink .bashrc and .bash_profile into the user's home directory

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

