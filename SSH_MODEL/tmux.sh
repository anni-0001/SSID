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

RT_DIR="/home/ubuntu"
experiment_num=$(cat $RT_DIR/purple/round.txt)
dev_num=$(cat $RT_DIR/purple/dev-num.txt)


service ssh restart

# Accessing aliases to use in script
cat ~/.bashrc > myalias.txt
source myalias.txt 
shopt -s expand_aliases

# n = n, number of “commands”/bursts of traffic (e.g., number of times to loop)
# attacker_send = s, number of characters to send by the attacker (for the current command)
# victim_send = r, number of characters to send by the victim machine (for the current command)
# sleep_cmd = p, time to sleep before starting the next command in the loop



devices=$(cat $RT_DIR/purple/dev-num.txt)
echo " [*] running tmux.sh"

tmux new -d -s mySession
# Split the window horizontally into two panes
tmux split-window -h
# sleep 5

# initiating tcpdump packet capture 
tmux send-keys -t mySession.0 "tcpdump -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/dev1.pcap" Enter
echo " [*] Starting pcap capture..."

# sleep 5

# initiating ssh tunnel
# tmux send-keys -t mySession.1 "ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4" Enter
echo " [*] Building tunnel..."
# sleep 10

sshtunnel=" "

for ((i=2; i<=devices; i++)); do
    sshtunnel+="ssh -A -t -p 22 root@dev$i "
done 

# tcptunnel=$sshtunnel
tmux send-keys -t mySession.1 "$sshtunnel" Enter
echo "[*] Tunnel established"


# tmux session management UNCOMMENT HERE IF TMUX/SSH STOPS WORKING
# tmux a -t mySession
# tmux d -t mySession

# Accessing aliases to use in script
# cat ~/.bashrc > myalias.txt
# source myalias.txt 
# shopt -s expand_aliases

# Call the Python script and capture the output into a Bash array
output=($(python3 $RT_DIR/purple/p_script.py))

# Assign the array elements to individual Bash variables
burst_total="${output[0]}"
bytes_recieved="${output[1]}"
bytes_send="${output[2]}"
burst_sleep="${output[3]}"

# Use the Bash variables in other commands
echo "burst_total: $burst_total"
echo "bytes_recieved: $bytes_recieved"
echo "bytes_send: $bytes_send"
echo "burst_sleep: $burst_sleep"

sleep 2
s_attacker=" "

# creating arbitrary attacker send string
for ((z=1; z<=bytes_send-19; z ++)); do
    s_attacker+="x"
done

echo "Attacker string: $s_attacker"
# sleep 1

for((b=1; b <=burst_total; b++)); do
    # put into tmux send keys:
    # tmux send-keys -t mySession.1 'n=$bytes_recieved; a; echo $s_attacker 2>/dev/null' Enter
    tmux send-keys -t mySession.1 'n=$bytes_recieved; a; echo $s_attacker' Enter
    # echo "$s_attacker >> $RT_DIR/purple/history.txt"

    # sleep $burst_sleep
    tmux send-keys -t mySession.1 "sleep $burst_sleep" Enter

done

# seeing if commands are running
echo "$HOSTNAME">> $RT_DIR/purple/history.txt
history >> $RT_DIR/purple/history.txt
# # Call the Python script and capture the output into a Bash array
# output=($(python3 p_script.py))




# add latency

# reverse shell, file exfil, uneven send & recieves
# look at samples, spin up crawler on multi machine





# echo " [*] reattatching to session tmux"
tmux a -t mySession
echo " [*] killing tmux session"
tmux kill-session -t mySession

# # Set the working directory for the right pane
# tmux send-keys -t mysession:0.1 'cd /path/to/right/pane' Enter