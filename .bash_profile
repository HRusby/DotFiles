#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
# Add .NET Core SDK tools
export EDITOR=lvim
export PATH="$PATH:/home/harry/.dotnet/tools"
alias lvim='/home/harry/.local/bin/lvim'
alias nvim='lvim'
xclip -o | xclip -selection clipboard -i
