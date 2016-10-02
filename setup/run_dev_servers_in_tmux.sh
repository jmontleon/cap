#!/bin/sh

export CAP_GO="$GOPATH/src/github.com/jmrodri/cap-go"

cd $CAP_GO
go get
go build

tmux new-session -s "dev" -n react -d "cd /vagrant && npm start"
tmux new-window -t "dev:1" -n "cap-go" "cd ${CAP_GO} && ./cap-go"
