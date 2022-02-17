# Dotfiles

This is a repo for dotfiles. Note that the setup scripts aren't working right now

## vim

The vim configuration I use is contained in the `vim` folder, as well as in `.vimrc` in the root directory of the repo.
These can be symlinked to from a `home` directory so that updates from this repo will reflect into those places

## Required package

A few other packages are required to use this configuration without error

* vim - obviously with the packages outlined in the vim directory.
* Bash Completion - This can be installed using the instructions below
* Powerline - (link here)[https://github.com/b-ryan/powerline-shell]
* (zsh syntax highlighting)[https://github.com/zsh-users/zsh-syntax-highlighting.git]

### Bash-Completion Instructions

#### MacOS

1) Check if `BASH_VERSION > 4`
2) Install with `brew install bash-completion@2`
3) Add the following to your `.bash_profile`

```bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
```

### Zsh Syntax Highlighting

#### Gentoo (emerge)

```bash
app-shells/zsh-syntax-highlighting
```

#### Macos

```bash
brew install zsh-syntax-highlighting
```


