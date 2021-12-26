#!/usr/bin/env bash

scriptName="AUR Packages"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(
	# ----- Classification -----
	'spotify'	# Music Player
	'polybar'	# I3 Bar
)

installYay(){
	# For Yay Installs from AUR
	echo "CLONING: Yay"
	git clone "https://aur.archlinux.org/yay.git"
	pacman -S --needed git base-devel
	cd yay
	makepkg -si
	echo "Yay Installed"
}

pacman -Qi yay && echo Yay Installed || installYay

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	# For packages from AUR
	yay -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
