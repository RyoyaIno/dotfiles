# load bashrc
if [ -f ~/.bashrc ]; then
  source $HOME/.bashrc
fi

# display
export PS1="[\u@\H:\W]\$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\(\1\)/')\n$ "
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# goenv
# require `brew install golang` for system version
# require `git clone https://github.com/syndbg/goenv.git ~/.goenv`
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
if type goenv >/dev/null 2>&1; then
  eval "$(goenv init -)"
  export GOROOT="$(goenv prefix)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$GOPATH/bin:$PATH"
fi

# nodenv
# require `brew install nodenv`
export PATH="$HOME/.nodenv/bin:$PATH"
if type nodenv >/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# jenv
# require `brew install jenv`
# example)
#  - `brew tap caskroom/versions`
#  - `brew cask install java11`
#  - `source ~/.bash_profile`
# confirm local installed versions `/usr/libexec/java_home -V`
export PATH="$HOME/.jenv/bin:$PATH"
if type jenv >/dev/null 2>&1; then
  eval "$(jenv init -)"
  jenv add $(/usr/libexec/java_home) >/dev/null
fi

# dotnet for C#
# require `brew cask install dotnet`
export PATH=/usr/local/share/dotnet:$PATH

# mono for C#
# require `brew install mono`
export MONO_GAC_PREFIX="/usr/local"

# direnv
# require `brew install direnv`
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# openssl
# require `brew install openssl`
# nodenv dependency
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

