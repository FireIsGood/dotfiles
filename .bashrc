#! /bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User specific environment and startup programs

#* Set up environment stuff *#

# Use nvim to edit instead of vi
export EDITOR='nvim'

# Cargo environment variables
. "$HOME/.cargo/env"

# Git autocompletion
. "/usr/share/bash-completion/completions/git"

# Ignore entries with leading spaces
HISTCONTROL=ignorespace

# pnpm
export PNPM_HOME="/home/fireisgood/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ghcup (Haskell)
[ -f "/home/fireisgood/.ghcup/env" ] && source "/home/fireisgood/.ghcup/env" # ghcup-env

# GPG key or something?
# export GPG_TTY=$tty

#* Start up Starship *#
eval "$(starship init bash)"

#* Startup commands *#

if [ "$TERM_PROGRAM" == "vscode" ]; then
    true
else
    # clear && fakeneofetch
    true
fi
