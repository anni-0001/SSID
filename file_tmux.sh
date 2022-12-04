#!/bin/bash

# tmux new-session -s ses-0 -n my-screen-name -d




tmux new -d -s mySession
sleep 2
tmux split-window -v
# tmux send-keys -t mySession.1 "timeout 25 tcpdump -i en0 -w tcpdump.sh"
tmux send-keys -t mySession.1 "cd ~/Music" C-m
tmux send-keys -t mySession.1 "mkdir tmux; date; sleep 3; date" C-m
# tmux send-keys -t mySession.1 "sleep 10" C-m
tmux send-keys -t mySession.1 "touch tmux.txt; date" C-m


tmux a -t mySession
