#!/usr/bin/env bash

scriptName="Cargo"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

	# ----- Classification -----
  'tree-sitter-cli' # Required for AstroNvim
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo cargo install "$PKG"
done

echo
echo "Done!"
echo
