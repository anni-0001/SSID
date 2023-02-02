#!/bin/bash 

# hard-coded params
SCAN_TIME=50
RT_DIR="/purple/version3"
TCP_DIR="/purple/tcpdump"

service ssh restart

if [ $1 ]
then
    experiment_num=$1
else
    experiment_num=0
fi

experiment_num=$(cat /purple/version3/round.txt)
if [ $2 ]
then
    scan_time=$2
else
    scan_time=$SCAN_TIME   # default scantime
fi

# I don't understand these purpose...
#experiment_num=$(cat $RT_DIR/round.txt)
#scan_time=$(cat $RT_DIR/scan_time.txt)

if [ "$HOSTNAME" == "dev1" ]; then
    # echo " [*] Running tmux.sh on $HOSTNAME"
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
    # something to send signal that script is done
    # want main loop in external to start timing of building and breaking of containers
    
else
    # echo " [*] Running tcpdump on $HOSTNAME"
    timeout $scan_time tcpdump  -i eth0 -U -w $TCP_DIR/$experiment_num/$HOSTNAME.pcap
fi