#!/bin/bash

# === UNIX ===
alias sx="source $ZDOTDIR/.zshrc"
alias xx="vim $ZDOTDIR/.zshrc"
alias untargz='tar xvf'
alias cp='cp -i'
alias ff="find . -name "
alias dirsize="du -sh"
alias l="ls -lh"
alias la="ls -lah"
alias hist="history"
alias dirsize="du -sh"
alias dirsizecurrent="echo 'Calculating...'; du -shc ./* | sort -rh"
alias diffleft="diff --changed-group-format='%<' --unchanged-group-format=''"
alias diffright="diff --changed-group-format='%>' --unchanged-group-format=''"
alias where="whereis"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'