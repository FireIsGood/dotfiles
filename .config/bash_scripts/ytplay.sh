#!/usr/bin/env bash

SECRET_FILE="$HOME/.config/bash_scripts/secrets.json"

# Use FZF on the secret.json file finding the ".yt values"
selected=$(jq -r ".yt | keys | .[]" <"$SECRET_FILE" | fzf --prompt=" YouTube Playlist  " --pointer="󰎇" --exit-0)

# Guard against early return
if [[ -z $selected ]]; then
	echo "No playlist selected"
	exit 0
fi

# Get value of that key
entry=$(jq -r ".yt.\"${selected}\"" <"$SECRET_FILE")

args="--no-video"

# If we have a flag -v play video
if [[ $* == *-v* ]] || [[ $* == *--video* ]]; then
	args=""
fi

clear
mpv --shuffle --loop-playlist --term-osd-bar=yes --term-osd-bar-chars="[██.]" "$entry" "${args}"
