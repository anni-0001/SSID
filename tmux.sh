#!/bin/bash

# tmux new-session -s ses-0 -n my-screen-name -d

# tmux split-window -v
# tmux attach-session -t 0
# tmux send-keys -t 0 "htop" C-m
# # tmux send-keys -t 1 "timeout 10 tcpdump -i en0" C-m


# tmux send-keys -t 1 "sleep 10" C-m
# # tmux send-keys -t ses-0 "htop" C-m

# tmux attach-session -t ses-0

# tmux send-keys -t 1 "echo hi" C-m
# tmux attach-session -t ses-0


tmux new -d -s mySession
tmux split-window -v




# tmux send-keys -t mySession.0 "cd .." ENTER
sleep 2
tmux send-keys -t mySession.0 "sleep 10;date" C-m
# tmux a -t mySession
# tmux d -t

sleep 2
tmux send-keys -t mySession.0 "echo hi ; date" C-m
# tmux a -t mySession

sleep 2
tmux send-keys -t mySession.0 "sleep 10;date" C-m

sleep 5
tmux send-keys -t mySession.0 "echo bye; date" C-m
# sleep 2
tmux send-keys -t mySession.0 "sleep 10;date" C-m

sleep 2
tmux send-keys -t mySession.1 "echo window2; date" C-m
sleep 5
tmux send-keys -t mySession.0 "echo bye; date" C-m
sleep 5
tmux a -t mySession

