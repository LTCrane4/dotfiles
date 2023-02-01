# Load zsh autocomplete
# autoload -Uz compinit && compinit

# Pull in files from .zshincludes
if [[ -d "~/.zsh_includes" ]]; then
  for file in ~/.zsh_includes/*.zsh; do
    [[ -r $file ]] && source $file;
  done
fi
# 
# if [[ -e $(which vim) ]]; then
#   export EDITOR="$(which vim)"
# fi

[[ $- != *i* ]] && return

# case ${TERM} in
# 	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
# 		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
# 		;;
# 	screen*)
# 		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
# 		;;
# esac

use_color=true

# Parse git branch
git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if ${use_color} ; then
	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
# alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
# shopt -s checkwinsize

# shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
# shopt -s histappend

#
#  ex - archive extractor
#  usage: ex <file>
function ex ()
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
alias open="xdg-open"
alias python="python3"
alias pip='pip3'

# export JAVA_HOME="/usr/lib/jvm/default"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-16.0.2.jdk/Contents/Home"
# 
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# export MAKEFLAGS='-j4'
# 

autoload -Uz compinit && compinit

if [[ -e /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
else if [[ -e /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -e '$(which neofetch)' ]]; then
  neofetch
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias gitp="git push"

