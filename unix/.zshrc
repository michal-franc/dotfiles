export ZSH=/home/mfranc/.oh-my-zsh
export GOPATH=$HOME/go
export PATH="$PATH:/usr/lib/go-1.9/bin:$GOPATH/bin"

export VISUAL='vim'
export EDITOR='vim'

plugins=(git z zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

alias t="task rc.data.location=.todo"

#todo expand it to do a grep with all the notes
#todo expand it even further to enable for n l - display list of notes with number 
#todo n 1 -> cat this note
#todo n 'test' 1 -> add to notes number 1
#there could be diffent modes - nodes in current project folder, global notes
function n() {
 if [[ $# -eq 0 ]] ; then
     cat .notes;
 else
     echo "- $@" >> .notes;
 fi 
}

function calendar() {
  gcalcli calw --calendar michal.franc@just-eat.com --monday -w 30
}

function screen() {
  maim --noopengl -s | xclip -selection clipboard -t image/png
}

function screenf() {
  maim --noopengl -s ~/Pictures/$(date +%s).png
}

function autotest() {
  if  [[ $1 == 'python' ]]; then
    rg --files -tpy | entr python3 -m unittest
  fi

  if  [[ $1 == 'rust' ]]; then
    rg --files -trust | entr cargo test -- --nocapture
  fi

  if  [[ $1 == 'bash' ]]; then
    rg --files -tsh | entr bats $2
  fi
}


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/sls.zsh ]] && . /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/sls.zsh

source ~/.zplug/init.zsh

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

zplug zsh-users/zsh-autosuggestions, from:github, as:plugin

zplug load

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mfranc/tools/google-cloud-sdk/path.zsh.inc' ]; then source '/home/mfranc/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mfranc/tools/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/mfranc/tools/google-cloud-sdk/completion.zsh.inc'; fi
