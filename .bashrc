#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=1000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth

alias ls="ls --color=auto"

ResetColor="\e[0m"
Black="\e[30m"
Red="\e[31m"
Green="\e[32m"
Yellow="\e[33m"
Blue="\e[34m"
Magenta="\e[35m"
Cyan="\e[36m"
White="\e[37m"

function mkPS1 () {
    PS1="\[${Red}\][\[${Yellow}\]\u\[${Green}\]@\[${Cyan}\]\h\[${Blue}\]]\[${Magenta}\]\w \[${ResetColor}\]"
}

mkPS1
