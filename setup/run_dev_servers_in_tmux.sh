#!/bin/sh

export SERVICE_BROKER="$GOPATH/src/github.com/fusor/origin-template-service-broker"

tmux new-session -s "dev" -n "service-broker" -d "cd $SERVICE_BROKER && make run"

# Skip a UI build if the developer has vagrant set in UI_DEV mode
# While in UI_DEV mode, the developer is expected to be running the react build
# server on a host machine and producing js builds to cap-ui/build
#if ! [ "$1" == "--uidev" ]; then
  #pushd /home/vagrant/cap-ui && npm run build && popd
#fi
