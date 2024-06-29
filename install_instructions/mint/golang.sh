# TODO take the version from env variable and let the user decide which one to use
#echo installing golang 1.12.6
pushd ~/Downloads
 wget https://dl.google.com/go/go1.22.4.linux-amd64.tar.gz
 sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
popd
