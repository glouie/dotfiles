#!/bin/zsh

#
# function to open either a file for editing or create one. 
# 
function e() {

    if [ $# -gt 0 ]; then

        if [[ "$1" == "-o" ]]; then
            # If -o is passed as the first argument, default to use 'open'
            open "$@"
        else
            $EDITOR "$@"
        fi
    else 
        fd -H . | fzf --preview 'bat --color=always {}' --bind enter:'become(nvim {})'
    fi

}


