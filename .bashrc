[[ $- != *i* ]] && return

alias ls='ls --color=auto'

_RED="$(tput setaf 1)"
_GREEN="$(tput setaf 2)"
_MAGENTA="$(tput setaf 5)"
_CYAN="$(tput setaf 6)"
_NC="$(tput sgr0)"

_DEVCOLOUR=$_MAGENTA
_UATCOLOUR=$_GREEN
_PRODCOLOUR=$_RED

_PRODSTR="prod"
_UATSTR="uat"
_DEVSTR="dev"

SetEnvColour(){
	[[ "$KUBEENV" == "$_DEVSTR" ]] && export KUBECOLOUR="${_DEVCOLOUR}" 
	[[ "$KUBEENV" == "$_UATSTR" ]] && export KUBECOLOUR="${_UATCOLOUR}" 
	[[ "$KUBEENV" == "$_PRODSTR" ]] && export KUBECOLOUR="${_PRODCOLOUR}"
}

SetEnv(){
	export KUBEENV="$1" && SetEnvColour
}

#SetDevPrompt(){
	#export KUBEENV="DEV" &&	export KUBECOLOUR=
#}

#SetUatPrompt(){
	#export KUBEENV="UAT" && export KUBECOLOUR="${_UATCOLOUR}"
#}
#
#SetProdPrompt(){
	#export KUBEENV="PROD" && export KUBECOLOUR="${_PRODCOLOUR}"
#}

kubectl(){
	#[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && [[ "$3" == "prod" ]] && SetProdPrompt
	#[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && [[ "$3" == "uat" ]] && SetUatPrompt
	#[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && [[ "$3" == "dev" ]] && SetDevPrompt
	[[ "$1" == "config" ]] && [[ "$2" == "use" ]] && SetEnv $3
	builtin kubectl "$@"
}

docker(){
	[[ "$1" == "container" ]] && [[ "$2" == "list" ]] && SetEnv "uat"
	command docker "$@"
}

#SetEnv $(kubectl config current-context)
SetEnv $(echo dev)
PS1="\[\${_CYAN}\]\u@\h \@ \W \$\[${_NC}\] \[\${KUBECOLOUR}\]\${KUBEENV}\[\${_NC}\] "

alias config='/usr/bin/git --git-dir=/home/harry/.cfg/ --work-tree=/home/harry'
