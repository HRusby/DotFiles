#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "$HOME" || return

PKGS=(

	# ----- Classification -----
	'jandedobbeleer/oh-my-posh/oh-my-posh' # Package Purpose

)
# Pre Reqs
sudo pacman -Sy base-devel procps-ng curl file git
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	brew install "$PKG"
done

echo
echo "Done!"
echo
