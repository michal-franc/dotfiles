export ZSH=/home/mfranc/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/scripts
export GO111MODULE=on

eval $(luarocks path --bin)

export VISUAL='vim'
export EDITOR='vim'

plugins=(git z zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

alias tlocal="task rc.data.location=.todo"
alias tall="task"
# aliases
alias cat='bat'
# load todos in bulk
alias tnbulk="xargs -L1 task rc.data.location=.todo add pro:next < todo.md"

# create dir for other functions
# so that /blog -> pro:blog
# if .git repo will use .git base folder
function tdir() {
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
  echo $dir
}

docs() {
  project=$(tdir)
  vim ~/Work/docs-projects/$project.md
}

# used to set project coefficient 
tproj() {
  project=$(tdir)
  task config urgency.user.project.$project.coefficient $1
}

# create new script folder == project
function t() {
  dir=$(tdir)

  context=$(task _get rc.context)
  if [ "$context" = "form3" ]; then
    task +$context pro:$dir $@
  else
    task pro:$dir $@
  fi
}

function n() {
 todayFileFolder=~/notes/quick-notes/"$(date +%Y-%m-%d).md"

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

function nall() {
  for filename in ~/notes/quick-notes/*.*; do
    cat $filename
  done
}

# TODO: make one function for these scripts n and worklog
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
