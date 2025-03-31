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

# PATH related
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # brew
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"                                                 # ghcup-env
[ -f "$HOME/.deno/env" ] && source "$HOME/.deno/env"                                                   # deno-env

# Message to send after loading
PROMPTMESSAGE=""

# Init prompt
# command -v starship &>/dev/null && source <(starship init bash --print-full-init) || PROMPTMESSAGE+='Starship is not installed!\n'
command -v oh-my-posh &>/dev/null && eval "$(oh-my-posh init bash --config $HOME/.config/oh-my-posh/zen.yml)" || PROMPTMESSAGE+='Oh My Posh is not installed!\n'

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
export PAGER="nvim +Man!"
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

echo -en "\e[31m$PROMPTMESSAGE\e[0m"
