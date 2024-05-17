#! /bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# User specific environment
if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
unset rc

# Starship (funny symbol if in NIX)
if [[ -z "$IN_NIX_SHELL" ]]; then
	export NIX_FUNNY_ICON="❇"
fi

source <(/usr/local/bin/starship init bash --print-full-init)

#
# --- PACKAGE MANAGER ---
#

# Lmao in bash?

#
# --- Shell settings ---
#

# Editor for home and remote connections
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR="$HOME/.local/bin/nvim.appimage"
fi

# Pagers
export PAGER="nvim"
export GIT_PAGER="less"
export LESS='-RF'

# Cargo environment variables
. "$HOME/.cargo/env"

# Ignore entries with leading spaces
HISTCONTROL=ignorespace

#
# --- Keybindings ---
#

# Aliases
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

#
# --- OTHER ---
#

# Shell integrations
eval "$(fzf --bash)"
eval "$(zoxide init --cmd cd bash)"
