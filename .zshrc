export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
source ~/.gvm/scripts/gvm
export GOPATH=$HOME/Work/go-src
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/tools:$HOME/scripts:$HOME/.tfenv/bin:$GOPATH/bin/mockery

export NOTES_DIR=$HOME/notes

if [ -x "$(command -v luarocks)" ]; then
  eval $(luarocks path --bin)
fi

export VISUAL='vim'
export EDITOR='vim'

plugins=(git gitfast z aws common-aliases docker extract fasd sudo taskwarrior vi-mode)
source $ZSH/oh-my-zsh.sh

# sudo command overrides
bindkey "xx" sudo-command-line
# overrides default vi-mode key timeout
export KEYTIMEOUT=20
# bind vi-mode cmd mode to kk
bindkey -M viins 'kk' vi-cmd-mode

# disable default taskwarrior alias for t
unalias t

if [ -x "$(command -v cargo)" ]; then
  source $HOME/.cargo/env
fi

alias tlocal="task rc.data.location=.todo"
alias tall="task"
alias tw="timew"
alias gs="git status"

git config --global alias.force "push --force-with-lease"

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

# added by travis gem
[ -f /home/mfranc/.travis/travis.sh ] && source /home/mfranc/.travis/travis.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mfranc/.sdkman"
[[ -s "/home/mfranc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mfranc/.sdkman/bin/sdkman-init.sh"


