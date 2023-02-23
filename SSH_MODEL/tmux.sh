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

# Accessing aliases to use in script
cat ~/.bashrc > myalias.txt
source myalias.txt 
shopt -s expand_aliases

# n = n, number of “commands”/bursts of traffic (e.g., number of times to loop)
# attacker_send = s, number of characters to send by the attacker (for the current command)
# victim_send = r, number of characters to send by the victim machine (for the current command)
# sleep_cmd = p, time to sleep before starting the next command in the loop

# ** placeholder values for random sample from Clares data **

attacker_send=30
victim_send=45
p_sleep=$(( $RANDOM % 15 + 1 ))
n_rounds=$(( $RANDOM % 10 + 1 ))

devices=$(cat /purple/version3/dev-num.txt)
cmdround=1
port=22




echo " [*] running tmux.sh"

sleep 5

tmux new -d -s mySession

sleep 3

# Split the window horizontally into two panes
tmux split-window -h

# initiating tcpdump packet capture 
tmux send-keys -t mySession.0 "tcpdump -i eth0 -U -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap" Enter
echo " [*] Starting pcap capture..."

sleep 5

# initiating ssh tunnel
# tmux send-keys -t mySession.1 "ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4" Enter
echo " [*] Building tunnel..."
sleep 10

sshtunnel=" "
for ((i=2; i<=devices-1; i++)); do
    sshtunnel+="ssh -A -t -p $port root@dev$i "
done 

tcptunnel=$sshtunnel
tmux send-keys -t mySession.1 "$sshtunnel" Enter


# tmux session management
tmux a -t mySession
tmux d -t mySession

for ((x=1; x<=cmdround; x++));do
    echo "attacker side command: $x"
    tmux send-keys -t mySession.1 "n=$n_rounds; a"
    sleep $p_sleep
done


echo " [*] reattatching to session tmux"
tmux a -t mySession
echo " [*] killing tmux session"
tmux kill-session -t mySession

# # Set the working directory for the right pane
# tmux send-keys -t mysession:0.1 'cd /path/to/right/pane' Enter