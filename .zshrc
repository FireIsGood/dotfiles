# Init starship
source <(/usr/local/bin/starship init zsh --print-full-init)

#
# --- PACKAGE MANAGER ---
#


#
# --- SHELL SETTINGS ---
#

# Load completions
autoload -Uz compinit && compinit

# History
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Pagers
export PAGER="nvim"
export GIT_PAGER="less"
export LESS='-RF'

#
# Keybindings
#

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#
# --- OTHER ---
#

# Fake neofetch
# Do the funny if not in vscode or neovim
if [[ "$TERM_PROGRAM" == "vscode" ]] || [[ -n "$NVIM" ]]; then
  true
else
  clear && fakeneofetch
fi
