#!/bin/sh

# run etcd
/tmp/test-etcd/etcd &

export SERVICE_BROKER="$GOPATH/src/github.com/fusor/ansible-service-broker"

tmux new-session -s "dev" -n "service-broker" -d "cd $SERVICE_BROKER && go get github.com/fsouza/go-dockerclient && make run"
tmux new-window -t "dev" -n "mock-registry" -d "cd $SERVICE_BROKER && go get github.com/fsouza/go-dockerclient && make run-mock-registry"

# Skip a UI build if the developer has vagrant set in UI_DEV mode
# While in UI_DEV mode, the developer is expected to be running the react build
# server on a host machine and producing js builds to cap-ui/build
#if ! [ "$1" == "--uidev" ]; then
  #pushd /home/vagrant/cap-ui && npm run build && popd
#fi
