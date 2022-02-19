# !/bin/bash
# A simple script that will back up and symlink dotfiles into the user's home directory

BASHRC="$HOME/.bashrc"
BASH_PROFILE="$HOME/.bash_profile"
ZSHRC="$HOME/.zshrc"
ZSH_PROFILE="$HOME/.zsh_profile"

echo "Select the default shell you would like to use:"
echo "1. Bash"
echo "2. Zsh"
read shell

if [[ $shell -eq 1 ]]; then
  if [[ -e "$BASHRC" ]]; then
    echo "Backing up exising bashrc"
    mv $HOME/.bashrc $HOME/.bashrc.bak
  fi

  if [[ -e $BASH_PROFILE ]]; then
    echo "Backing up .bash-profile"
    mv $HOME/.bash_profile $HOME/.bash_profile.bak
  fi

  echo "Linking .bashrc"
  ln -s $(pwd)/.bashrc $HOME/.bashrc
  echo "Linking .bash_profile"
  ln -s $(pwd)/.bash_profile $HOME/.bash_profile
  source $HOME/.bashrc
  exit 0
elif [[ $shell -eq 2 ]]; then
  if [[ -e $ZSHRC ]]; then
    echo "Backing up existing zshrc"
    mv $HOME/.zshrc $HOME/.zshrc.bak
  fi
  if [[ -e $ZSH_PROFILE ]]; then
    echo "Backing up existing zsh_profile"
    mv $HOME/.zsh_profile $HOME/.zsh_profile.bak
  fi

  echo "Linking .zshrc" 
  ln -s $(pwd)/.zshrc $HOME/.zshrc
  echo "Linking .zsh_profile"
  ln -s $(pwd)/.zsh_profile $HOME/.zsh_profile
  echo "Linking zsh_includes"
  ln -s $(pwd)/zsh $HOME/.zsh_includes
else
  echo "Not a valid option.  Exiting."
  exit -1
fi

# if [[ -e "$BASHRC" ]]; then
#   echo "Backing up existing .bashrc"
#   mv ~/.bashrc ~/.bashrc.bak
# fi
#
# # Symlink bashrc
# echo "Symlinking .bashrc"
# ln -s ./.bashrc ~/.bashrc
#
# if [[ -e "$BASH_PROFILE" ]]; then
#   echo "Moving existing .bash_profile"
#   mv ~/.bash_profile ~/.bash_profile.bak
# fi
#
# echo "Symlinking .bash_profile"
# ln -s ./.bash_profile ~/.bash_profile
#
# echo "Checking vim installation"
# if [[ -e $(which vim) ]]; then
#   echo "Vim install found!"
#   if [[ -e "~/.vimrc" ]]; then
#     echo "Backing up existing .vimrc"
#     mv ~/.vimrc ~/vimrc.bak
#   fi
#
#   ln -s ./vimrc ~/.vimrc
# else
#   echo "No vim install detected.  Please install vim and try again"
# fi
#
