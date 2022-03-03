sudo apt update && sudo apt upgrade

#!/usr/bin/env bash

scriptName="Template"

echo
echo "Installing ${scriptName}"
echo

cd "${HOME}"

PKGS=(

  'bash-completion',
  # Language Servers
  'yaml-language-server',
  'lua-language-server',
  # NVim requirements
  'fd',       # Find Alternative for Telescope
)
PKGS = {
  "build-essential", # Standard build tools inc gcc
  "lazygit", # CLI Git Integration
  "manpages-dev", # Development Man Pages
  "tree", # File structure visualisation
  "ripgrep", # Improved Grep built in rust
  "jq", # Json Query
  "fd-find", # find alternative
  "nodejs", # node install
  "npm", # npm install
}

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo apt install "$PKG" --noconfirm --needed
done

echo && echo "Install Nvim 0.6.1"
curl -Lk -o neovim.appimage https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
chmod u+x neovim.appimage && ./neovim.appimage
sudo mv ./neovim.appimage /usr/bin/nvim

echo "Linking fdfind to fd"
sudo ln -s $(which fdfind) /usr/bin/fd

echo "Installing lua-language-server"
curl -kL -o lua-language-server.tar.gz https://github.com/sumneko/lua-language-server/releases/download/2.6.6/lua-language-server-2.6.6-linux-x64.tar.gz
sudo tar -xvzf lua-language-server.tar.gz -C /usr/bin/lua-language-server-code

echo "Installing yaml-language-server"
sudo npm config set strict-ssl false
sudo npm i -g yaml-language-server
sudo npm config set strict-ssl true

echo "Installing nvm"
curl -ko- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo
echo "Done!"
echo
