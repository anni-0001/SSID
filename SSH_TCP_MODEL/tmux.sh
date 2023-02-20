#!/bin/bash

if [ $1 ]; then
    experiment_num=$1
else
    experiment_num=0
fi
if [ $2 ]; then
    scan_time=$2
else
    scan_time=200
fi

service ssh restart


cmdround=1
port=22
echo " [*] running tmux.sh"

# safety sleep?
sleep 5

tmux new -d -s mySession
# tmux new -s mySession

sleep 3

# Split the window horizontally into two panes
tmux split-window -h

# initiating tcpdump packet capture 
tmux send-keys -t mySession.0 "tcpdump -i eth0 -U -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap" Enter
echo " [*] Starting pcap capture..."

sleep 5

devices=$(cat /purple/version3/dev-num.txt)

# initiating ssh tunnel
# tmux send-keys -t mySession.1 "ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4" Enter
echo " [*] Building tunnel..."
sleep 10

sshtunnel=" "
for ((i=2; i<=devices; i++)); do
# tmux send-keys -t mySession.1 "ssh -A -t -p $port root@dev$i "
sshtunnel+="ssh -A -t -p $port root@dev$i "
done 

tmux send-keys -t mySession.1 "$sshtunnel" Enter
# tmux session managementy
tmux a -t mySession
tmux d -t mySession



p_sleep=$(( $RANDOM % 15 + 1 ))
n_rounds=$(( $RANDOM % 10 + 1 ))
while [ "$cmdround" -le $n_rounds ]
do 
    cmd=$(shuf -n 1 /purple/version3/cmd.txt)
    printf "$cmd \n"
    tmux send-keys -t mySession.1 "$cmd" Enter
    #tmux send-keys -t mySession.1 "date" Enter
    # rand=$(( $RANDOM % 10 + 1 ))
    sleep $p_sleep
    # sleep alias 

    ((cmdround ++))
done 

echo " [*] reattatching to session tmux"
tmux a -t mySession
echo " [*] killing tmux session"
tmux kill-session -t mySession
# Set the working directory for the left pane
# tmux send-keys -t mysession:0.0 'shuf -n 1 cmd.txt' Enter

# # Set the working directory for the right pane
# tmux send-keys -t mysession:0.1 'cd /path/to/right/pane' Enter