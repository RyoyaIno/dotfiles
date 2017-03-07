source $HOME/.bashrc

# display
export PS1='[\u@\H:\W]
$ '
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# GOPATH
if type go >/dev/null 2>&1; then
  if [ ! -e $HOME/.go ];then
      mkdir $HOME/.go
  fi
  export GOPATH=$HOME/.go
  export GOBIN=$GOPATH/bin
fi

# nvm
if type brew >/dev/null 2>&1; then
  NVM_SCRIPT=$(brew --prefix nvm)/nvm.sh
  if [ -e $NVM_SCRIPT ]; then
    source $NVM_SCRIPT
    export NVM_DIR=$HOME/.nvm
  fi
fi

# rbenv
if type rbenv >/dev/null 2>&1; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
