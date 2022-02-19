#!/bin/zsh
# environment.zsh
# Defines environment variables

if [[ -e "$(which vim)" ]]; then
  export EDITOR="$(which vim)"
  export VISUAL="$(which vim)"
fi

UNAME="$(uname)"

# Set MacOS specific env variables
if [[ UNAME -eq "Darwin" ]]; then
  echo "uname is Darwin"
  ln -s /Library/Java/JavaVirtualMachines/jdk-16.0.2.jdk/Contents/Home /usr/lib/jvm/default
fi

export JAVA_HOME="/usr/lib/jvm/default"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"] && \. "$NVM_DIR/nvm.sh"

