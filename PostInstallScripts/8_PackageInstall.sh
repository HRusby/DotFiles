#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

	# ----- Classification -----
	'neovim',	# NeoVim Editor
	'spotify',	# Music Player
	'visual-studio-code-insiders-bin', # VS Code
	'dbeaver', 	# Database Editor
	'alacritty', 	# Terminal Emulator
	'aspnet-runtime', 	# Dotnet Dev
	'docker',	# Containerisation
	'docker-compose'# Containerisation
	'dolphin',	# File Manager
	'firefox',	# Web Browser
	'dotnet-sdk', 	# Dotner Dev
	'signal-desktop',# Encrypted Comms
	'sleek', 	# ToDo List
	'tmux', 	# Terminal Multiplexer

)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
