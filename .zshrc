export ZSH=/home/mfranc/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/scripts
export GO111MODULE=on

if [ -x "$(command -v luarocks)" ]; then
  eval $(luarocks path --bin)
fi

export VISUAL='vim'
export EDITOR='vim'

plugins=(git z)
source $ZSH/oh-my-zsh.sh

if [ -x "$(command -v cargo)" ]; then
  source $HOME/.cargo/env
fi

alias tlocal="task rc.data.location=.todo"
alias tall="task"

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
 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mfranc/tools/google-cloud-sdk/path.zsh.inc' ]; then source '/home/mfranc/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mfranc/tools/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/mfranc/tools/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.secret
