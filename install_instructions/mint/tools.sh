apt-get install maim

echo installing essential tools
apt-get install xclip zsh curl jq \
                tig entr taskwarrior \
                feh ncdu zathura htop bats -y


echo installing ripgrep
pushd ~/Downloads
  wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
  sudo dpkg -i ripgrep_13.0.0_amd64.deb
popd

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash