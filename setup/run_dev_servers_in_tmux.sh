#!/bin/sh

export SERVICE_BROKER="$GOPATH/src/github.com/fusor/ansible-service-broker"

tmux new-session -s "dev" -n "service-broker" -d "cd $SERVICE_BROKER && make run-mock-registry"
tmux new-window -t "dev:1" -n "mock-registry" -d "cd $SERVICE_BROKER && make run"
tmux new-window -t "dev:2" -n "broker-etcd" -d "/tmp/test-etcd/etcd"
