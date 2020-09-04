# for Terminal Messages
case "$TERM" in
xterm*|kterm*|rxvt*)
  PROMPT='%n@%m:%~$ '
;;
screen*)
  PROMPT='%n@%m:%~$ '
;;
esac

# vi input mode
bindkey -v
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

# shortcut for using ssh-agent
ssha() {
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
}

# disable Ctrl-S
stty stop undef

# aliases
alias ls='ls -F --color=auto'
