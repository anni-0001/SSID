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


cmdround=1
port=22
echo " [*] running tmux.sh"


tmux new -d -s mySession
# tmux new -s mySession

sleep 3

# Split the window horizontally into two panes
tmux split-window -h

# initiating tcpdump packet capture 
tmux send-keys -t mySession.0 "timeout $scan_time tcpdump -i eth0 -U -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap" Enter
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



# creating arbitrary attacker send string; 19 is extra bytes from spaces & ;
for ((z=1; z<=s-19; z ++)); do
    s_attacker+="1"
done

tmux send-keys -t mySession.1 "$ssh_tcp_tunnel" Enter
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