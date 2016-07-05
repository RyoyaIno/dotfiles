alias la='ls -al'
alias ll='ls -l'
export PS1='[\u@\H:\W]
$ '
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
