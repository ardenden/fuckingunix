#!/usr/bin/env bash

cd ~/.dotfiles

stow --target=$HOME --adopt home

declare -A paths=(
	["$HOME/.config/nvim"]="neovim"
	["$HOME/.config/Code/User"]="vscode"
	["$HOME/.var/app/com.visualstudio.code/config/Code/User"]="vscode-flatpak"
)

for target in "${!paths[@]}"; do
	mkdir -p "$target"
	stow --target="$target" --adopt "${paths[$target]}"
done
