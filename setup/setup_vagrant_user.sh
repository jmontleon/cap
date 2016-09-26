#!/bin/sh

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
