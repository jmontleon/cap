#!/bin/sh

pushd .
cd ~
git clone https://github.com/projectatomic/atomicapp.git
cd atomicapp
# Using same versions as we are seeing in recent packaged atomicapps 0.6.3
git checkout 0.6.3
sudo make install
popd

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
if [ "$?" -ne "0" ]; then
    exit
fi

source ~/.bash_profile
nvm install 6.5
if [ "$?" -ne "0" ]; then
    exit
fi

nvm use 6.5
if [ "$?" -ne "0" ]; then
    exit
fi

cd /vagrant
# https://github.com/npm/npm/issues/992#issuecomment-223479918
# https://github.com/npm/npm/issues/9633
# Have run into issue of npm install on shared folder with Vagrant & VirtualBox
npm install --no-bin-links
if [ "$?" -ne "0" ]; then
    exit
fi
