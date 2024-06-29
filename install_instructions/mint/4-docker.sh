# https://docs.docker.com/install/linux/docker-ce/ubuntu/
echo installing docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt-get install docker-compose -y

# If getting docker socket permission then run
usermod -a -G docker $USER

echo isntalling dive

pushd ~/Downloads
  wget https://github.com/wagoodman/dive/releases/download/v0.7.0/dive_0.7.0_linux_amd64.deb
  sudo apt install ./dive_0.7.0_linux_amd64.deb
popd

