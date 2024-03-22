#! /bin/bash

# NOTE: THIS FILE IS CALLED BY .bashrc
# NOTE: Created by me, not the system. It's where I can put aliases and other settings for fun

#!#### Fix Defaults ####!#
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

#!#### Aliases ####!#

# Fancy ls alias (replace with eza) and shorter version
alias ls='eza --group-directories-first --no-time --no-user --icons -hbF'
alias l='ls'      # Compact
alias la='ls -a'  # All files
alias ll='ls -l'  # List view
alias lla='ll -a' # List view all files

# Fancy zoxide alias
alias z='zoxide'
alias zah='zoxide add ./'

# Shorter clear command
alias c='clear'

# Shorter sudo end
alias sudover='sudo -k'

# Shorter upgrade and update
alias aptup='sudo apt update && sudo apt upgrade && sudo -k'

# Redo quickly command
alias f="fc -s"

# Fuzzy find man pages
alias fman="superman"
alias fm="fman"
function superman() {
	# FZF possible commands. Add query if given
	local CHOICE=$(compgen -c | fzf --query=${1})

	# If there's no input, exit
	[[ ${CHOICE} = "" ]] && echo "Canceled" && return

	# Try to display a man page, otherwise try to show a TLDR page
	man $CHOICE 2>/dev/null

	# If we found a Man page, exit
	[[ $? = 0 ]] && return

	echo -e "Oh man, there's no Man!\nTrying TLDR:"
	tldr $CHOICE

	# If we found a TLDR page, exit
	[[ $? = 0 ]] && return

	# No one can save you now...
	echo -e "Oh man, there's no Man or TLDR page!\nWelp, guess you're on your own!"
}

#* Program specific *#

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Shorter git commands
alias g='git'
alias gs='git status'
alias gd='git diff'

# Future fire, this is for a meme.
daniel() {
	args=$(echo $@ | sed 's/daniel/git/g')
	git $args 2>&1 >/dev/null | sed 's/git/daniel/g' | sed 's/GIT/DANIEL/g' | sed 's/Git/Daniel/g'
}

# Shorter lazygit command
alias lg='lazygit'
alias lazydaniel='lazygit'

# Shorter python3 command
alias py='python3'

# Shorter pnpm command
alias pn='pnpm'

# Bacon
alias ba='bacon' # Short

# YT-DLP
alias yt='yt-dlp --embed-metadata'
alias yta='yt-dlp --extract-audio --embed-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --format ba/b --sponsorblock-remove all'
function ytb() {
	'yt $@'
	'yta $@'
	echo "Finished downloading!"
}

# Fancy neofetch alias (and a fake one for speed)
alias fakeneofetch='clear && cat ~/.config/neofetch/fakenf.txt'
alias neofetch='neowofetch --size 230px --jp2a ~/.config/neofetch/peek.png'
alias nf='neofetch'

# Speedtest smaller alias
alias speedtest='speedtest-rs'
alias st='speedtest'

# Valgrind full checking
alias vgf="valgrind --leak-check=full --track-origins=yes"

# GDB quiet
alias gdb="gdb -q"

# Neovim
alias v="nvim"
# alias nv="nvim"

# Tmux
alias ta="tmux attach"

# fd find
alias fd="fdfind"

#* Fun *#

# sl (steam locomoitve) alias
alias sl='sl -ael'

# matrix alias (opens a new terminal on top)
alias matrix='konsole --profile=MATRIX --hide-menubar --hide-tabbar --fullscreen --separate -e cmatrix -u 10'

#* Functions *#

# Add a pasted file
# Use with `paste file.txt` or `echo "words" | paste`
function paste() {
	local file=${1:-/dev/stdin}
	curl --data-binary "@${file} https://paste.rs"
}

# Remove a link
function pasterm() {
	local url=${1}
	curl --request "DELETE" "${url}"
}

# Colorize man pages
# man() {
#     LESS_TERMCAP_md=$'\e[01;31m' \
#         LESS_TERMCAP_me=$'\e[0m' \
#         LESS_TERMCAP_us=$'\e[01;32m' \
#         LESS_TERMCAP_ue=$'\e[0m' \
#         command man "$@"
# }

# Use neovim as man pager
export MANPAGER='nvim +Man!'

#!#### Settings ####!#

# Shorten the displayed directory
# Just use pwd if you want to know it!
PROMPT_DIRTRIM=3

# Ignore case when autocompleting
# bind -s 'set completion-ignore-case on'

# Turn off ctrl+r for vscode moments
# bind -r "\C-r"

# export PATH=$PATH:/home/fireisgood/.cargo/bin

# Enable TheFuck (use "fuck" to fix previous command)
eval "$(thefuck --alias)"
