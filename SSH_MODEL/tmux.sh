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

s_attacker=30
victim_send=45
p_sleep=$(( $RANDOM % 15 + 1 ))
n_rounds=$(( $RANDOM % 10 + 1 ))

devices=$(cat /purple/SSH_MODEL/dev-num.txt)
cmdround=10
port=22

echo " [*] running tmux.sh"


tmux new -d -s mySession
# Split the window horizontally into two panes
tmux split-window -h
sleep 5

# initiating tcpdump packet capture 
tmux send-keys -t mySession.0 "tcpdump -i eth0 -U -w /purple/SSH_MODEL/tcpdump/$experiment_num/dev1.pcap" Enter
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

cmdround=10
s=30
s_attacker=""
r_victim=20
n_bursts=1

# creating arbitrary attacker send string
for ((z=1; z<=s-19; z ++)); do
    s_attacker+="1"
done

# create function that takes random value 
# python script samples all values and generates cmd as result of script
# cmd = python cmd.py

# add latency

# reverse shell, file exfil, uneven send & recieves
# look at samples, spin up crawler on multi machine

for ((x=1; x<=n_bursts; x++));do
    n_rounds=$(( $RANDOM % 10 + 1 ))

    # echo "attacker side command: $x"
    tmux send-keys -t mySession.1 "n=$n_rounds; a; $s_attacker 2>/dev/null"
    # n=$n_rounds; a; $s_attacker 2>/dev/null
    sleep $p_sleep
done

# for i in 


echo " [*] reattatching to session tmux"
tmux a -t mySession
echo " [*] killing tmux session"
tmux kill-session -t mySession

# # Set the working directory for the right pane
# tmux send-keys -t mysession:0.1 'cd /path/to/right/pane' Enter