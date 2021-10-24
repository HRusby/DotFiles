#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

	# ----- Classification -----
	'pkgName'	# Package Purpose

)

# For Yay Installs from AUR
echo "CLONING: Yay"
git clone "https://aur.archlinux.org/yay.git"
pacman -S --needed git base-devel
cd yay
makepkg -si


for PKG in "${PKGS[@]}"; do
	# For packages from Arch Repo
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed

	# For packages from AUR
	yay -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
