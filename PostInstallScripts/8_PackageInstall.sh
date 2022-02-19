#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

	# ----- Classification -----
	'i3',		# Window Manager
	'spotify',	# Music Player
  'lightdm'   # Display Manager
	'alacritty', 	# Terminal Emulator
	'thunar',	# File Manager
	'firefox',	# Web Browser
	'signal-desktop',# Encrypted Comms
  # CLI Tools
	'neovim',	# NeoVim Editor
	'docker',	# Containerisation
	'docker-compose'# Containerisation
	'tree',						# Cli directory visualisation
	'dotnet-sdk', 	# Dotner Dev
	'aspnet-runtime', 	# Dotnet Dev
	'tmux', 	# Terminal Multiplexer
	'feh', 	# Wallpaper Controller
  'xclip',    # Clipboard Cli Utility
  'gawk',     # Awk Implementation
  'jq',        # Json Query
  'man-db',
  'man-pages',
  'tar',
  'tmux',
  'wget',
  'bash-completion',
  # Language Servers
  'yaml-language-server',
  'lua-language-server',
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
