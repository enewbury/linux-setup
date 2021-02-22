#!/usr/bin/env zsh

# Lines configured by zsh-newuser-install
setopt beep extendedglob nomatch notify
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
# End of lines added by compinstall

FPATH=/usr/share/zsh/site-functions:$FPATH

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

source <(sheldon source)

# load local config
[ -f ~/.localrc ] && . ~/.localrc

eval "$(starship init zsh)"

# zprof
