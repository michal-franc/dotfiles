export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go



if [ -f ~/.gvm/scripts/gvm ]; then
  source ~/.gvm/scripts/gvm
fi

export GOPATH=$HOME/Work/go-src
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/tools:$HOME/scripts:$HOME/.tfenv/bin:$GOPATH/bin/mockery:/home/linuxbrew/.linuxbrew/bin

export NOTES_DIR=$HOME/notes

if [ -x "$(command -v luarocks)" ]; then
  eval $(luarocks path --bin)
fi

export VISUAL='nvim'
export EDITOR='nvim'

plugins=(git gitfast zoxide aws common-aliases docker extract sudo taskwarrior history encode64 nmap ripgrep terraform vault) 
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

alias gs="git status"
alias gpull="git pull master"
alias tui="taskwarrior-tui"
alias tg=". tgoto"

git config --global alias.force "push --force-with-lease"

if [ -x "$(command -v bat)" ]; then
  alias cat='bat'
fi

# disabling XON/XOFF flow control
stty -ixon

source ~/.zplug/init.zsh
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug zsh-users/zsh-autosuggestions, from:github, as:plugin
zplug load

if [ -f ~/.secret ]; then
  source ~/.secret
fi


if [ -f ~/globalprotect ]; then
  source ~/globalprotect
fi

# added by travis gem
[ -f /home/mfranc/.travis/travis.sh ] && source /home/mfranc/.travis/travis.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mfranc/.sdkman"
[[ -s "/home/mfranc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mfranc/.sdkman/bin/sdkman-init.sh"



# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
