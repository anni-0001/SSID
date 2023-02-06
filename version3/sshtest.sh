#!/bin/bash
devices=4
sshtunnel=" "
for ((i=1; i<=devices; i++)); do
# tmux send-keys -t mySession.1 "ssh -A -t -p $port root@dev$i "
sshtunnel+="ssh -A -t -p $port root@dev$i "
done 

echo $sshtunnel