export ZSH=/home/mfranc/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(git z)

source $ZSH/oh-my-zsh.sh

alias t=todolist


#todo expand it to do a grep with all the notes
#todo expand it even further to enable for n l - display list of notes with number 
#todo n 1 -> cat this note
#todo n 'test' 1 -> add to notes number 1
#there could be diffent modes - nodes in current project folder, global notes
function n() {
 if [[ $# -eq 0 ]] ; then
     cat .main.notes;
 else
     echo "- $@" >> .main.notes;
 fi 
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/sls.zsh ]] && . /home/mfranc/JustEat/JE.ElasticSearchSnapshot.Lambda/node_modules/tabtab/.completions/sls.zsh
