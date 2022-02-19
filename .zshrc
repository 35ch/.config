PROMPT="%F{red}[%f%F{yellow}%B%n%b%f%F{green}@%f%F{cyan}%m%f%F{blue}]%f%F{magenta} Σ%f "
RPROMPT='%~'

alias c='clear'
alias pip='pip3'
alias python='python3'
alias config="vim ~/.zshrc"

# Enable 256 color
export TERM="xterm-256color"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV="true"

# History options
HISTFILE=$HOME/.cache/zsh/.zsh_history
HISTSIZE=4096
SAVEHIST=$HISTSIZE
HISTIGNORE="c:ls:cd:exit:"

