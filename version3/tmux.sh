#!/bin/bash

# round=1
# dir_num=25
echo $round
# while [ $round -le $dir_num ]
# do 
#     echo round: $round

#     mkdir -p /purple/tcpdump/$round 2>&1 | grep -v "mkdir:"
#     # timeout SCAN_TIME docker-compose up --build

#     # tcpdump -i eth0 -w /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap


#     ((round ++))
# done &


# Create a new session

# tmux new-session -s mySession

# maybe just put all the tmux commmands into this file so that I can break down the experiment 
# and rebuild 

tmux new -d -s mySession

# Split the window horizontally into two panes
tmux split-window -h
round=1
cmdround=1

echo "running tmux.sh"

sleep 100

tmux send-keys -t mySession.1 "tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap" Enter

tmux send-keys -t mySession.0 ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4

while [ "$cmdround" -le 3 ]
do 
    cmd=$(shuf -n 1 cmd.txt)
    printf "$cmd \n"
    tmux send-keys -t mySession.0 "$cmd" Enter
    tmux send-keys -t mySession.0 "date" Enter
    # $cmd
    $(( $RANDOM % 10 + 1 ))
    # sleep 3

    ((cmdround ++))
done 

tmux a -t mySession

# Set the working directory for the left pane
# tmux send-keys -t mysession:0.0 'shuf -n 1 cmd.txt' Enter

# # Set the working directory for the right pane
# tmux send-keys -t mysession:0.1 'cd /path/to/right/pane' Enter