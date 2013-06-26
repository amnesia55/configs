# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Alias
alias c='clear'
alias e='exit'
alias g='git'

# Source git bash helper functions
source /usr/share/git-core/contrib/completion/git-prompt.sh

function prompt {
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    GIT_STATUS="__git_ps1"
    PS1='$($GIT_STATUS)'
    export PS1="$GREENBOLD\u@\h\[\033[00m\] $BLUEBOLD\w\[\033[00m\]$PS1 \\$ "
}  
prompt
