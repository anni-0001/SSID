#!/bin/bash

# Create a new session
# tmux new-session -s mySession
tmux new -d -s mySession

# Split the window horizontally into two panes
tmux split-window -v

round=1
while [ "$round" -le 3 ]
do 
    cmd=$(shuf -n 1 cmd.txt)
    printf "$cmd \n"
    tmux send-keys -t mySession.0 "$cmd" Enter
    tmux send-keys -t mySession.0 "date" Enter
    # $cmd
    $(( $RANDOM % 10 + 1 ))
    # sleep 3

    ((round ++))
done 

tmux a -t mySession

# Set the working directory for the left pane
# tmux send-keys -t mysession:0.0 'shuf -n 1 cmd.txt' Enter

# # Set the working directory for the right pane
# tmux send-keys -t mysession:0.1 'cd /path/to/right/pane' Enter