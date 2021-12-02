#!/usr/bin/env bash
# shellcheck shell=bash

# sudo apt-get install bash-completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# for tool in $(find $DOTNET_TOOLS -maxdepth 1 -type f); do ln -s ${tool} $HOME/.local/bin/$(basename "${tool/\/dotnet-/\/}"); done
alias gitversion="${DOTNET_TOOLS}/dotnet-gitversion"
alias sonarscanner="${DOTNET_TOOLS}/dotnet-sonarscanner"

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[01;32m\]\$\[\033[34m\] '
