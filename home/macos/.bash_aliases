#!/bin/bash

alias gfp="git fetch && git pull"
alias ml='multipass'

alias ls='eza'
alias ll='eza $PWD -lbF --git --icons'
alias l='eza -bFG --icons'
alias llm='eza -lbGd --git --sort=modified'
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias chore="git add . && git commit -m '~ chore' && git push"

# specialty views
alias lS='eza -1'
alias lt='eza $PWD --tree --level=2 --icons'
alias l.="eza -a | grep -E '^\.'"

