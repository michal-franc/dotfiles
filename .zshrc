export ZSH=/home/mfranc/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GO111MODULE=on

export VISUAL='vim'
export EDITOR='vim'

plugins=(git z zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

alias tlocal="task rc.data.location=.todo"
alias tall="task"
# load todos in bulk
alias tnbulk="xargs -L1 task rc.data.location=.todo add pro:next < todo.md"

# git add -> commit -> pull -> auto merge and push
function tsync() {
  pushd ~/todo
    git add -A
    git commit -m 'syncing todo'
    git pull origin master --no-edit
    git push origin master
  popd
}

# create new script folder == project
# so that /blog -> pro:blog
# if .git repo will use .git base folder
function t() {
 
  # check if this folder is inside git repo 
  $(git rev-parse --is-inside-work-tree > /dev/null 2>&1)

  # check if previous command failed
  # (if its not repo there is a fatal error)
  if [ $? -eq 0 ]; then
    dir=$(basename $(git rev-parse --show-toplevel))
    
    # check if this is main folder (as dotfiles .git)
    # or todo folder as this one is used for my tasks
    if [ $dir = $(basename ~) ] || [ $dir = 'todo' ]; then
      # if its dotfiles folder go to pwd
      dir=$(basename $PWD)
    fi
  else
    dir=$(basename $PWD)
  fi

  task pro:$dir $@
}

#todo expand it to do a grep with all the notes
#todo expand it even further to enable for n l - display list of notes with number 
#todo n 1 -> cat this note
#todo n 'test' 1 -> add to notes number 1
#there could be diffent modes - nodes in current project folder, global notes
#function n() {
# if [[ $# -eq 0 ]] ; then
#     cat .notes;
# else
#     echo "- $@" >> .notes;
# fi 
#}

# n - cat current notes
# nv -> opens todays note in vim
# n -> arg -> puts the arg into current quick note
#
# worklog (similar solution as n but static worklog file)

function n() {
 todayFileFolder=~/Notes/quick-notes/"$(date +%Y-%m-%d).md"

 if [ ! -f todayFileFolder ]; then
   echo Creating quick note for today
   touch $todayFileFolder
 fi

 if [[ $# -eq 0 ]] ; then
    cat $todayFileFolder;
 else
    echo "- $@" >> $todayFileFolder;
 fi 
}

# TODO: make one function for these scripts
function worklog() {
 file=~/notes/work/worklog.md

 if [[ $# -eq 0 ]] ; then
    cat $file | tail;
 else
    echo "- $@" >> $file;
 fi 
}

function calendar() {
  gcalcli calw --calendar michal.franc@just-eat.com --monday -w 30
}

function screen() {
  maim --noopengl -s -d 1 | xclip -selection clipboard -t image/png
}

function screenf() {
  if [[ $# -eq 0 ]] ; then
    maim --noopengl -s -d 1 ~/Pictures/$(date +%s).png
  else
    maim --noopengl -s -d 1 $PWD/$@
  fi 
}


function screenn() {
  folder=".images"
  if [[ $# -ne 0 ]] ; then
    folder=".images/${@}"
  fi

  if [ ! -d $folder ]; then
    echo Creating folder $folder
    mkdir $folder
  fi

  fileAndFolderName="${folder}/note-$(date +%s).png"
  maim --noopengl -s -d 1 $PWD/$fileAndFolderName
  echo "![note-image](${fileAndFolderName})" | xclip -selection clipboard
  echo Created file $fileAndFolderName and put it to clipboard
  echo use ctrl + v in your editor
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

  if  [[ $1 == 'go' ]]; then
    rg --files -tgo | entr go test $2
  fi
}

function prlist() {
  for d in `ls -d */`
  do
    echo $d
    pushd $d > /dev/null
    hub pr list -f '%sC%>(8)%i%Creset - %t %sC%au%Creset%n %sC%>(8)%Creset %sC%>(4)link%Creset %U%n%n'
    popd > /dev/null
  done
}

# aliases
alias cat='bat'

# disabling XON/XOFF flow control
stty -ixon


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
