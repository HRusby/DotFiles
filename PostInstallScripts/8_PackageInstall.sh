#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

	# ----- Classification -----
	'neovim',	# NeoVim Editor
	'i3',		# Window Manager
	'spotify',	# Music Player
    'lightdm'   # Display Manager
	#'visual-studio-code-insiders-bin', # VS Code
	#'dbeaver', 	# Database Editor
	'alacritty', 	# Terminal Emulator
	'docker',	# Containerisation
	'docker-compose'# Containerisation
	'thunar',	# File Manager
	'firefox',	# Web Browser
	'dotnet-sdk', 	# Dotner Dev
	'aspnet-runtime', 	# Dotnet Dev
	'signal-desktop',# Encrypted Comms
	#'sleek', 	# ToDo List
	'tmux', 	# Terminal Multiplexer
	'feh', 	# Wallpaper Controller
    'xclip'     # Clipboard Cli Utility
    # NVim requirements
    'ripgrep',  # Grep CMD Tool for telescope
    'fd',       # Find Alternative for Telescope
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
