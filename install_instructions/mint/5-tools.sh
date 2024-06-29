apt-get install maim

echo installing essential tools
apt-get install xclip zsh curl jq \
                tig entr taskwarrior \
                feh ncdu zathura htop bats ripgrep -y

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install