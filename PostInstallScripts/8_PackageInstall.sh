#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

	# ----- Classification -----
	'i3'		# Window Manager
	'spotify'	# Music Player
  'lightdm'   # Display Manager
	'alacritty' 	# Terminal Emulator
	'thunar'	# File Manager
	'firefox'	# Web Browser
	'signal-desktop'# Encrypted Comms
  # CLI Tools
	'neovim'	# NeoVim Editor
	'docker'	# Containerisation
	'docker-compose'# Containerisation
	'tree'						# Cli directory visualisation
	'dotnet-runtime' # Dotnet Run
	'dotnet-sdk' 	# Dotnet Dev
	'aspnet-runtime' 	# Dotnet Dev
  'cargo'   # Rust Package Manager
  'rust'  # Rust Language
	'tmux' 	# Terminal Multiplexer
	'feh' 	# Wallpaper Controller
  'xclip'    # Clipboard Cli Utility
  'gawk'     # Awk Implementation
  'jq'        # Json Query
  'bat'   # Modern Cat
  'atuin' # Improved terminal history
  'man-db'
  'man-pages'
  'tldr' # Man Summariser
  'dnsutils'
  'tar'
  'tmux'
  'wget'
  'bash-completion'
  'lazygit'
  'xsel' # Clipboard Manager
  # Setting up Audio via Pipewire
  'pipewire'
  'pipewire-audio'
  'pipewire-alsa'
  'pipewire-pulse'
  'wireplumber'
  'pulsemixer'
  'blueman'
  # Monitor Manager
  'xrandr'
  'arandr'  
  'rofi'  # Modern Program Launcher (DMenu extension)
  'picom' # Compositor
  # Language Servers
  'yaml-language-server'
  'lua-language-server'
  # NVim requirements
  'ripgrep'  # Grep CMD Tool for telescope
  'fd'       # Find Alternative for Telescope
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
