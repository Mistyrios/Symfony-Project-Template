################################################################################################
# symfony-project-template - Debian - A Global .bashrc File                                    #
# @author: Axel Salem                                                                          #
################################################################################################

# ~/.bashrc: executed by bash(1) for non-login shells.

# Colorizing shell variables and adding shell shortcuts
export LS_OPTIONS='--color=auto'
export SHELL='bash'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'
alias sf='php bin/console'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
