[[ $- != *i* ]] && return

alias ls='ls --color=auto'

_BLACK="$(tput setaf 0)"
_RED="$(tput setaf 1)"
_GREEN="$(tput setaf 2)"
_YELLOW="$(tput setaf 3)"
_BLUE="$(tput setaf 4)"
_MAGENTA="$(tput setaf 5)"
_CYAN="$(tput setaf 6)"
_WHITE="$(tput setaf 7)"
_NC="$(tput sgr0)"


export GOPATH="/home/harry/go"

pulse-discover-devices () {
	pacmd unload-module module-udev-detect && pacmd load-module module-udev-detect	
}

vim () {
	nvim $@
}

PS1="[\[\${_CYAN}\]\u\[\${_BLUE}\]@\[\${_CYAN}\]\h]\[\${_WHITE}\] \@ \w \n\$\[${_NC}\] "

alias config='/usr/bin/git --git-dir=/home/harry/.cfg/ --work-tree=/home/harry'

alias pacman-show-orphans='pacman -Qtdq'
alias pacman-remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'

export PATH="/home/harry/scripts:$PATH"
