#
# ~/.bashrc
#

if [[ -e $(which vim) ]]; then
  export EDITOR="$(which vim)"
fi

# Setup files
source $HOME/.bash_misc
source $HOME/.bash_env
source $HOME/.bash_alias
source $HOME/.bash_functions

# Parse git branch
git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

  if ${use_color} ; then
	  # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	  if type -P dircolors >/dev/null ; then
		  if [[ -f ~/.dir_colors ]] ; then
			  eval $(dircolors -b ~/.dir_colors)
		  elif [[ -f /etc/DIR_COLORS ]] ; then
			  eval $(dircolors -b /etc/DIR_COLORS)
		  fi
	  fi

	  if [[ ${EUID} == 0 ]] ; then
		  # PS1='\[\e[1;31m\][\e[1;32m]\u@\h\[\e[01;36m\] \W\[\e[01;31m\]]$(git_branch)\$\[\e[00m\] '
		  j# PS1='\[\[\e[1;31m\]\][\[\e[1;32m\]\]\u\[\[\e[1;35m\]\] \W\[\[\e[1;32m\]\]\[\e[1;31m\]\]]\[\e[1;37m\]\]\[\e[0;36m\]\]$(git_branch)\[\e[1;37m\]\]\$\[\e[00m\]\] '
      PS1='\[\e[1;31m\]!\u@\h]\[\e[1;37m\]\$ '
	  else
		  # PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$(git_branch)\$\[\033[00m\] '
		  #PS1='\[\[\e[1;31m\]\][\[\e[1;33m\]\]\u\[\e[0;32m\]\]@\[\e[1;34m\]\]\h\[\[\e[1;35m\]\] \W\[\[\e[1;32m\]\]\[\e[1;31m\]\]]\[\e[1;37m\]\]\[\e[0;36m\]\]$(git_branch)\[\e[1;37m\]\]\$\[\e[00m\]\] '
      PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[0;32m\]@\[\e[1;34m\]\h\[\e[1;35m\] \W\[\e[1;32m\]\[\e[1;31m\]]\[\e[1;37m\]\[\e[0;36m\]$(git_branch)\[\e[1;37m\]\$\[\e[00m\] '
	  fi

	  alias ls='ls --color=auto'
	  alias grep='grep --colour=auto'
	  alias egrep='egrep --colour=auto'
	  alias fgrep='fgrep --colour=auto'
  else
	  if [[ ${EUID} == 0 ]] ; then
		  # show root@ when we don't have colors
		  PS1='\u@\h \W \$ '
	  else
		  PS1='\u@\h \w \$ '
	  fi
  fi
# fi

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Teddy - Aliases
alias la="ls -latG --color"

# Git cli completion
if [[ '$(uname)' == 'Linux' ]]; then
  if [[ -e /usr/share/bash-completion/completions/git ]]; then
      source /usr/share/bash-completion/completions/git
  fi
fi

# USB hot plug fix
export MTP_NO_PROBE="1"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export MAKEFLAGS='-j4'

if [[ '$(uname)' == 'Linux' ]]; then
  export PATH='$PATH:/opt/apps/postman'
fi

export PATH="/usr/local/opt/openjdk@17/bin:/usr/local/opt/postgresql@15/bin:$PATH"
export JAVA_HOME="/usr/local/opt/openjdk@11/"

export PATH="$HOME/bin:$PATH"

# Completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# End completions

test -f $HOME/.git-completion.bash && . $_

alias python="python3"
alias pip="python3 -m pip"

export DOTNET_ROOT="$HOME/dotnet"
export PATH="$PATH:$HOME/dotnet"


