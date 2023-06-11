# YOU NEED TO INSTALL PYTHOIN BEFORE


echo installing ohmyzsh
# https://github.com/robbyrussell/oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

----------------------
# zplug https://github.com/zplug/zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

----------------------
!!!! revert zshrc change as it will be overwritten by zplug install

source ~/.zshrc
zplug install
