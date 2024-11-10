# PATH related
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # brew
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Message to send after loading
PROMPTMESSAGE=""

# Init prompt
# command -v starship &> /dev/null && source <(starship init zsh --print-full-init) || PROMPTMESSAGE+='Starship is not installed!\n'
command -v oh-my-posh &> /dev/null && eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/zen.yml)" || PROMPTMESSAGE+='Oh My Posh is not installed!\n'

#
# --- PACKAGE MANAGER ---
#

# Bootstrap Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U +X compinit && compinit

# Add in snippets
# zinit snippet OMZP::command-not-found

#
# --- Shell settings ---
#

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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Pagers
export PAGER="nvim"
export GIT_PAGER="less"
export LESS='-RF'

#
# --- Keybindings ---
#

# Shell keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^[[3~" delete-char
bindkey "^[[32;2u" magic-space
bindkey "^[[1;5D" emacs-backward-word
bindkey "^[[1;5C" emacs-forward-word

# Aliases
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

#
# --- OTHER ---
#

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Fake neofetch
# Do the funny if not in vscode or neovim
if [[ "$TERM_PROGRAM" == "vscode" ]] || [[ -n "$NVIM" ]]; then
  true
else
  clear && fakeneofetch
fi

echo -en "\e[31m$PROMPTMESSAGE\e[0m"
