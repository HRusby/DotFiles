[[ $- != *i* ]] && return

alias ls='ls --color=auto'

_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_MAGENTA=$(tput setaf 5)
_CYAN=$(tput setaf 6)
_NC=$(tput sgr0)

nocho(){
	param1="$1"
	fullyQualified="$(builtin echo -e ${_MAGENTA}) $param1 $(builtin echo -e ${_NC})"
	[[ "$param1" == "tt" ]] && fullyQualified="$(builtin echo -e ${_RED}) $param1 $(builtin echo -e ${_NC})"
	[[ "$param1" == "t" ]] &&  fullyQualified="$(builtin echo -e ${_GREEN}) $param1 $(builtin echo -e ${_NC})"
	export TEST="$fullyQualified" && builtin echo "$param1"
}

SetDevPrompt(){
	fullyQualified="$(builtin echo -e ${_CYAN}) DEV $(builtin echo -e ${_NC})"
	export TEST="$fullyQualified"
}


SetUatPrompt(){
	fullyQualified="$(builtin echo -e ${_GREEN}) UAT $(builtin echo -e ${_NC})"
	export TEST="$fullyQualified"
}

SetProdPrompt(){
	prodStr="PROD"
	fullyQualified="$(echo -e ${_RED})$prodStr $(echo -e ${_NC})"
	export TEST="$fullyQualified" 
}

kubectl(){
	[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && [[ "$3" == "prod" ]] && $(SetProdPrompt)
	[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && [[ "$3" == "uat" ]] && $(SetUatPrompt)
	[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && [[ "$3" == "dev" ]] && $(SetDeDevPrompt)
	builtin kubectl "$@"
}

docker(){
	[[ "$1" == "container" ]] && [[ "$2" == "list" ]] && SetDevPrompt
	command docker "$@"
}

PS1='${_CYAN}\u@\h \@ \W \$${_NC} $TEST '

OrigPS1='\[\033[36m\]\u@\h \[\033[94m\]\W\[\033[39m\]\$ ($TEST)'
alias config='/usr/bin/git --git-dir=/home/harry/.cfg/ --work-tree=/home/harry'
