#!/bin/sh

# run etcd
/tmp/test-etcd/etcd &

export SERVICE_BROKER="$GOPATH/src/github.com/fusor/ansible-service-broker"

# HACK: this goes away when I get client added to glide
cd $SERVICE_BROKER && go get github.com/fsouza/go-dockerclient

tmux new-session -s "dev" -n "service-broker" -d "cd $SERVICE_BROKER && make run-mock-registry"
tmux new-window -t "dev:1" -n "mock-registry" -d "cd $SERVICE_BROKER && make run"
