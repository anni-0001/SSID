#! /bin/bash

<< comment
runs commands in ssh tunnel pane of tmuxinator

comment

tmux send-keys -t ssh "echo hi" Enter 
sleep 5
tmux send-keys -t ssh "sleep 10" Enter 
sleep 5

tmux send-keys -t ssh "env" Enter 
sleep 5

tmux send-keys -t ssh "sleep 10" Enter 
sleep 5

tmux send-keys -t ssh "pwd" Enter 
sleep 5

tmux send-keys -t ssh "echo hi" Enter
sleep 5

tmux send-keys -t ssh "sleep 10" Enter 


# do an nmap scan - detect port based scanning activity through ssh tunnel session?

