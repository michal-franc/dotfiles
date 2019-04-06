export ZSH=/home/mfranc/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/scripts
export GO111MODULE=on

if [ -x "$(command -v luarocks)" ]; then
  eval $(luarocks path --bin)
fi

export VISUAL='vim'
export EDITOR='vim'

plugins=(git z aws common-aliases docker extract fasd sudo taskwarrior vi-mode)
source $ZSH/oh-my-zsh.sh

# sudo command overrides
bindkey "ss" sudo-command-line
# overrides default vi-mode key timeout
export KEYTIMEOUT=20
# bind vi-mode cmd mode to kk
bindkey -M viins 'kk' vi-cmd-mode

if [ -x "$(command -v cargo)" ]; then
  source $HOME/.cargo/env
fi

alias tlocal="task rc.data.location=.todo"
alias tall="task"
alias gs="git status"

if [ -x "$(command -v bat)" ]; then
  alias cat='bat'
fi

# load todos in bulk
alias tnbulk="xargs -L1 task rc.data.location=.todo add pro:next < todo.md"

# disabling XON/XOFF flow control
stty -ixon

source ~/.zplug/init.zsh
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug zsh-users/zsh-autosuggestions, from:github, as:plugin
zplug load

if [ -f ~/.secret ]; then
  source ~/.secret
fi
